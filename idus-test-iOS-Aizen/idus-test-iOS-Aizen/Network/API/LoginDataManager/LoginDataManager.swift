//
//  LoginDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation
import Alamofire

class LoginDataManager {
    
    //이메일 로그인
    //로그인 api -> Post 방식 (/app/users/login)
    func loginPost(_ parameters : EmailLoginRequest, delegate: EmailLoginViewController){
        AF.request("\(Constant.BASE_URL)/app/users/logIn", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil) //엔티티 ->Json 인코딩
            .responseDecodable(of : EmailloginResponse.self){ response in
                //반환 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
                switch response.result{
                case .success(let response)://서버 연결 성공
                    
                    //로그인 성공
                    if((response.isSuccess) != false){
                        delegate.didSuccessLogin()
                        
                        
                        //토큰 저장 (키 체인 사용)
                        let userIdx = response.result.userIdx
                        let jwtToken = response.result.jwt
                        KeyChainManager.shared.createUser(User(userIdx: userIdx, jwtToken: jwtToken))
                        
                        UserDefaults.standard.set(response.result.jwt, forKey: "jwtToken")
                    }else {//로그인 실패
                        if response.code == 3014{
                            delegate.failedLogin(message: "없는 아이디거나 비밀번호가 틀렸습니다.")
                        }else{
                            delegate.failedLogin(message: "데이터베이스 연결에 실패하였습니다.")
                        }
                    }
                    
                    
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //서버 연결 실패
                    delegate.failedLogin(message: "서버 연결에 실패하였습니다.")
                }
                
            }
    }
    
}
