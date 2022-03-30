//
//  PurchaseResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import Foundation

//구매 결과 반환 엔티티
struct PurchaseResponse : Codable {
    var result : PurchaseResult
    
    var isSuccess : Bool
    var code : Int
    var message : String
}

struct PurchaseResult : Codable {
    var workId : Int
    var userId : Int
    var status : Int
    
}
