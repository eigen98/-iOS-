//
//  EmailLoginResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation
//이메일 로그인 요청 반환 엔티티
struct EmailloginResponse : Codable {
    let result : LoginResultArray
    let isSuccess : Bool
    let code : Int
    let message : String
}

struct LoginResultArray : Codable{
    let userIdx : Int
    let jwt : String
}
