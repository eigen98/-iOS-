//
//  DetailResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

//상세화면 엔티티
struct DetailResponse : Codable{
    
    var result : [ArticleDetailEntity]?
    var isSuccess : Bool
    var code : Int
    var message : String
    
}

struct ArticleDetailEntity : Codable {
    var workId : Int
    var authorId : Int
    var category : String
    var title : String
    var price : Int
    var deliveryPrice : Int //delivery_price
    var deliveryStart : String //delivery_start
    var quantity : String
    var content : String
    var interestStatus : Int
    var starCnt : Int
    var star : Float
    var keyword : [String]
    var imgs : [String]
    
    var workComment : [CommentResponse]?
    
    var workReview : [ReviewResponse]?
    
    enum CodingKeys : String, CodingKey{
        case workId = "workId"
        case authorId = "authorId"
        case category = "category"
        case title = "title"
        case price = "price"
        case deliveryPrice = "delivery_price" //delivery_price
        case deliveryStart = "delivery_start"//delivery_start
        case quantity = "quantity"
        case content = "content"
        case interestStatus = "interestStatus"
        case starCnt = "starCnt"
        case star = "star"
        case keyword = "keyword"
        case imgs = "imgs"
        
        case workComment = "workComment"
        
        case workReview = "workReview"
    }
}
