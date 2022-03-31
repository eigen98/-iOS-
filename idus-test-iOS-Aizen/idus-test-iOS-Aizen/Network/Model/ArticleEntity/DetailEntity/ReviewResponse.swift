//
//  ReviewResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import Foundation

struct ReviewResponse : Codable {
    var isSuccess : Bool
    var code : Int
    var message : String
    
    var result : ReviewEntity
    
}
