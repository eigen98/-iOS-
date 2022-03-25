//
//  SignUpResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

//회원가입 응답 엔티티
struct SignUpResponse : Codable{
    let result : InfoArray
    let isSuccess : Bool
    let code : Int //1000
    let message : String // 요청에 성공하였습니다.
}

struct InfoArray : Codable{
    let userIdx : Int //1
    let name : String // eigen
}
