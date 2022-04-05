//
//  CommentDeleteResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/05.
//

import Foundation

struct CommentDeleteResponse : Codable {
    var result : DeletedCommentEntity

    var isSuccess : Bool
    var code : Int
    var message : String
    
}

struct DeletedCommentEntity : Codable {
    var deletedId : Int
    var result : String // 삭제 완료
}


