//
//  ProfileResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

struct ProfileResponse : Codable {
    let result : UserResult?
    let isSuccess : Bool
    let code : Int
    let message : String //요청에 성공하였습니다.
}

struct UserResult : Codable {
    let id : Int
    let email : String
    let name : String
    let birthday : Date? // 2000-01-01
    let gender : Int
    let phone : String
    let recipient : String? //수령인
    let recipientPhone : String? //수령인 번호
    let address : String? //서울시 00동
    let profileImg : String? // 이미지 url
}
