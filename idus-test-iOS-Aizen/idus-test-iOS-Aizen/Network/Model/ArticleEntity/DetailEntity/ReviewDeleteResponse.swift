//
//  ReviewDeleteResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/05.
//

import Foundation
struct ReviewDeleteResponse : Codable {
    var result : DeletedReviewEntity
    
    var isSuccess : Bool
    var code : Int
    var message : String
}

struct DeletedReviewEntity : Codable {
    var deleteId : Int
    var result : String
}
