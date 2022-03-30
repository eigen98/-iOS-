//
//  CommentWriteResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/30.
//

import Foundation

//댓글 쓰기 api 반환 엔티티
struct CommentWritingResponse : Codable{
    var result : CommentResponse?
    
    var isSuccess : Bool
    var code : Int
    var message : String
}
