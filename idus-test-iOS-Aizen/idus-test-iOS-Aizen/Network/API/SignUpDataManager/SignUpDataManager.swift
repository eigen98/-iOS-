//
//  File.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation
import Alamofire

//회원가입 관련 api
class SignUpDataManager{
    
    //이메일 회원가입
    //유저 생성 api -> Post 방식 (/app/users)
    func signUpPost(_ parameters : SignUpRequest, delegate: EmailSignUpViewController){
        AF.request("\(Constant.BASE_URL)/app/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil) //엔티티 ->Json 인코딩
            
            .responseDecodable(of : SignUpResponse.self){ response in
                //반환 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
                switch response.result{
                case .success(let response)://서버 연결 성공
                    
                    //회원가입 성공
                    if((response.isSuccess) != nil){
                        delegate.didSuccessSignUP(response: response)
                    }else {//회원가입 실패
                        if response.code == 4011{
                            delegate.failedSignUP(message: "비밀번호 암호화에 실패하였습니다.")
                        }else{
                            delegate.failedSignUP(message: "데이터베이스 연결에 실패하였습니다.")
                        }
                    }
                    
                    
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //서버 연결 실패
                    delegate.failedSignUP(message: "서버 연결에 실패하였습니다.")
                }
                
            }
    }
    
    
}
