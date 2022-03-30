//
//  CommentRequest.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/30.
//

import Foundation
//댓글 api 요청 엔티티
struct CommentRequest : Codable {
    let workId : Int
    let content : String
}
