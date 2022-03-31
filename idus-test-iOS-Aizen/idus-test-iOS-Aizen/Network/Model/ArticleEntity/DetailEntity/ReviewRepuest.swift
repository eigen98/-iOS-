//
//  ReviewRepuest.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import Foundation

//리뷰 작성 요청 시 필요한 엔티티
struct ReviewRequest : Codable {
    
    var workId : Int
    var content : String
    var star : Float
    var reviewImg : [String]
}
