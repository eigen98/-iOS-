//
//  ZzimResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import Foundation
//관심 작품 등록 api 요청 반환 엔티티
struct ZzimResponse : Codable {
    
    var result : ZzimItem
    
    var isSuccess : Bool
    var code : Int
    var message : String
    
}

struct ZzimItem : Codable {
    var workId : Int
    var userId : Int
    var status : Int
}
