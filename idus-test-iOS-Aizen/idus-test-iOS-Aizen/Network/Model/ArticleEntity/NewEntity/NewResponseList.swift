//
//  NewResponseList.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation

//사용 X
//작품 리스트 얻어올 때 사용할 작품 리스트 엔티티
struct NewResponseList : Decodable{
    var ArticleList : [NewResponse]
}
