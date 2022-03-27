//
//  CommentResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

struct CommentResponse : Codable{
    var workCommentId : Int
    var name : String
    var comment : String
}
