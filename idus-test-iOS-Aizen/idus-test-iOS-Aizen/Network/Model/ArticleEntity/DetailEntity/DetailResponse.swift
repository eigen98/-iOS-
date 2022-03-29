//
//  DetailResponse.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

//상세화면 엔티티
struct DetailResponse : Codable{
    
    var result : ArticleDetailEntity
    var isSuccess : Bool
    var code : Int
    var message : String
    
    //"isSuccess": true,
    //    "code": 1000,
    //    "message": "요청에 성공하였습니다.",
    //    "result": {
    
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
    
    var workComment : [CommentResponse]
    
    var workReview : [ReviewResponse]
    
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
//

/*
    "isSuccess": true,
    "code": 1000,
    "message": "요청에 성공하였습니다.",
    "result": {
        "workId": 4,
        "authorId": 4,
        "category": "음료(커피,차)",
        "title": "작품4",
        "price": 10000,
        "delivery_price": 3000,
        "delivery_start": "5일 이내",
        "quantity": "주문시 제작",
        "content": "작품4내용",
        "interestStatus": 1,
        "starCnt": 3,
        "star": 3,
        "keyword": [
            "작품4 키워드",
            "작품4 키워드2",
            "작품4 키워드3",
            "작품4 키워드4"
        ],
        "imgs": [
            "https://image.shutterstock.com/image-photo/korean-traditional-side-dishessesame-leafsquashpeanutbrackenkimchi-600w-1342590401.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg",
            "https://image.shutterstock.com/image-photo/korean-food-dried-shredded-squid-600w-1758532142.jpg"
        ],
        "workComment": [
            {
                "workCommentId": 13,
                "name": "ollie",
                "comment": "작품4에 댓글"
            },
            {
                "workCommentId": 14,
                "name": "ollie4",
                "comment": "작품4에 댓글2"
            },
            {
                "workCommentId": 15,
                "name": "ollie33",
                "comment": "작품4에 댓글3"
            },
            {
                "workCommentId": 16,
                "name": "ollie5",
                "comment": "작품4에 댓글4"
            }
        ],
        "workReview": [
            {
                "workReviewId": 5,
                "name": "ollie",
                "star": 2,
                "createdAt": "2022년 03월 24일",
                "content": "후기5",
                "reviewImg": "https://image.shutterstock.com/image-photo/glass-iced-passion-fruit-blurry-600w-1694917474.jpg"
            },
            {
                "workReviewId": 11,
                "name": "ollie33",
                "star": 4,
                "createdAt": "2022년 03월 26일",
                "content": "4번작품후기2",
                "reviewImg": "https://image.shutterstock.com/image-photo/cup-coffee-latte-heart-shape-600w-1568190193.jpg"
            },
            {
                "workReviewId": 12,
                "name": "ollie2",
                "star": 3,
                "createdAt": "2022년 03월 26일",
                "content": "4번작품후기3",
                "reviewImg": null
            }
        ]
    }
*/
