//
//  ReviewResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

struct ReviewEntity : Codable {
    var workReviewId : Int
    var name : String
    var star : Float
    var createdAt : String
    var content : String
    var reviewImg : String?
}


