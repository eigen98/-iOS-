//
//  New.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

//New탭 조회 API 응답 엔티티
struct NewResponse : Codable{
    var result : [NewResult]?
    
    var isSuccess : Bool
    var code : Int
    var message : String
}

struct NewResult : Codable {
    var workId : Int
    var authorId : Int //  author_id 변환
    var title : String
    var workImg : String
    var interestStatus : Int
    
    enum CodingKeys : String, CodingKey {
        case workId = "workId"
        case authorId = "author_id"
        case title = "title"
        case workImg = "workImg"
        case interestStatus = "interestStatus"
    }


}
