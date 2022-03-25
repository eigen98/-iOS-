//
//  EmailLoginRequest.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

//이메일 로그인 요청 엔티티
struct EmailLoginRequest : Codable{
    let email : String
    let password : String
}
