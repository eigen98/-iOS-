//
//  ProfileDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation
import Alamofire
//특정 유저 프로필 조회 api
class ProfileDataManager{
    
    //로컬에 저장된 jwt토큰
    
    
    
    
    func getUserProfile(delegate: MyInfoViewController) {
        let url = "\(Constant.BASE_URL)/app/users/profile"
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        print("jwt is = \(jwt!)")
        
        //"Content-Type":"application/json",
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: ProfileResponse.self) { response in
                switch response.result {
                case .success(let response): //서버 정상
                    if(response.isSuccess != false){
                        //프로필 조회 성공 시
                        print("response = \(response.code)" )
                        print("jwt가 = \(response.message)")
                        delegate.didSuccessProfileRequest(response: response)
                        
                        // 유저 정보 로컬에 저장
                    }else {
                        //프로필 조회 불가
                        switch response.code {
                        case 4000 :
                            print("데이터베이스 연결에 실패하였습니다.")
                        case 2002 :
                            print("유효하지않은 JWT입니다.")
                        case 3014 :
                            print("없는 아이디거나 비밀번호가 틀립니다.")
                        default:
                            print("실패하였습니다.")
                        }
                        
                    }
                case .failure(let error): //서버 연결 실패
                    print(error.localizedDescription)
                    delegate.presentAlert(title: "서버 연결에 실패하였습니다.")
                }
            }
    }
    
    //Mark : 프로필 수정 메소드
    func patchUserProfile(_ parameters : ProfilePatchRequest, delegate : MyProfileSetViewController){
        let url = "\(Constant.BASE_URL)/app/users"
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        print("jwt is = \(jwt!)")
        
        //"Content-Type":"application/json",
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        
        AF.request(url, method: .patch ,parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: ProfileResponse.self) { response in
                switch response.result {
                case .success(let response): //서버 정상
                    if(response.isSuccess != false){
                        //프로필 수정 성공 시
                        print("프로필 수정 response = \(response.code)" )
                        print("프로필 수정 jwt상태는 \(response.message)")
                        // 화면 텍스트 업데이트
                        delegate.updateMyAccount(userData: response)
                        // 유저 정보 로컬에 저장
                    }else {
                        //프로필 조회 불가
                        switch response.code {
                        case 4000 :
                            print("데이터베이스 연결에 실패하였습니다.")
                        case 2002 :
                            print("유효하지않은 JWT입니다.")
                        case 3014 :
                            print("없는 아이디거나 비밀번호가 틀립니다.")
                        default:
                            print("실패하였습니다.")
                        }
                        
                    }
                case .failure(let error): //서버 연결 실패
                    print(error.localizedDescription)
                    
                }
            }
        
    }
    
    
    func isAleadyLogin(delegate: LoginMainViewController) {
        let url = "\(Constant.BASE_URL)/app/users/profile"
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        if jwt == nil {
            // 유저 정보가 없을 시 중단
            return
        }
        print("jwt is = \(jwt)")
        
        //"Content-Type":"application/json",
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: ProfileResponse.self) { response in
                switch response.result {
                case .success(let response): //서버 정상
                    if(response.isSuccess != false){
                        //프로필 조회 성공 시
                        print("자동로그인 = \(response.code)" )
                        print("자동로그인이 메시지 = \(response.message)")
                        delegate.didLogin(response: response)
                        
                        // 유저 정보 로컬에 저장
                    }else {
                        //프로필 조회 불가
                        switch response.code {
                        case 4000 :
                            print("데이터베이스 연결에 실패하였습니다.")
                        case 2002 :
                            print("유효하지않은 JWT입니다.")
                        case 3014 :
                            print("없는 아이디거나 비밀번호가 틀립니다.")
                        default:
                            print("실패하였습니다.")
                        }
                        
                    }
                case .failure(let error): //서버 연결 실패
                    print(error.localizedDescription)
                    print("자동로그인 서버 연결에 실패하였습니다.")
                   
                }
            }
    }
}
