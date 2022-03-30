//
//  CommentResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation
//상세화면에서 불러올 api 요청 반환 댓글정보  엔티티
struct CommentResponse : Codable{
    var workCommentId : Int
    var name : String
    var comment : String
}


