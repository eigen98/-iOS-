//
//  SignUpRequest.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

// 회원가입 요청 entity
struct SignUpRequest : Codable{
    let email : String
    let name : String
    let password : String
    let password2 : String
    let phone : String
    let recommendedCode : String?
    let receivingConsent : Int?  //수신 동의 동의1, 비동의0 , 선택안할 시 자동 0
}
