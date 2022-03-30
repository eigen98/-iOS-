//
//  PurchaseDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import Foundation
import Alamofire

//작품 구매하기 api (GET)
class PurchaseDataManager {
    //로컬에 저장된 jwt토큰
    var jwt = KeyChainManager.shared.readUser()?.jwtToken
    
    //New탭 작품 조회
    func purchaseGet(delegate: OrderPayViewController, articleId : Int) {
        //path Variable 사용
        if jwt == nil {
            print("유효한 jwt가 없습니다.")
            //로그아웃으로 인해 로그인 되어 있지않다면 종료
            return
        }
        //찜 api url
        let url = "\(Constant.BASE_URL)/app/works/purchase/\(articleId)"
        print("jwt is = \(jwt!)")
        
        
        //"Content-Type":"application/json",
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: PurchaseResponse.self) { response in
                switch response.result {
                case .success(let response): //서버 정상
                    if(response.isSuccess != false){
                        //
                        print("구매 결과 코드는 = \(response.code)" )
                        print(" 구매 여부 = \(response.isSuccess)")
                        // delegate.didSuccessProfileRequest(response: response)
                        print("\(response.result.workId)번 아이템 구매 완료")
                        print("\(response.result.status)-> 1이면 구매된 상태")
                        //delegate.didSuccessGetArticles(response: response)
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
                    print("구매 서버 연결 실패")
                    delegate.presentAlert(title: "서버 연결에 실패하였습니다.")
                }
            }
    }
    
}
