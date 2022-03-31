//
//  ReviewDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import Foundation
import Alamofire
//후기 쓰기 (POST)
class ReviewDataManager{
    let keyChainManager = KeyChainManager.shared
    
    //review 작성 api -> Post 방식 (/app/works/review)
    func commentPost(_ parameters : ReviewRequest, delegate: WriteReviewViewController){
        
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        
        print("jwt is = \(jwt!)")
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        AF.request("\(Constant.BASE_URL)/app/works/review", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header) //엔티티 ->Json 인코딩
            .responseDecodable(of : ReviewResponse.self){ response in
                //반환 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
                switch response.result{
                case .success(let response)://서버 연결 성공
                    
                   
                    print("후기 작성 성공 ")
                    print("후기 쓴 작품 \(parameters.workId)")
                    var temp = response.result
                    
                
                    print("\(temp.content)")
                 
                    delegate.dismiss(animated: true, completion: {
                        delegate.reviewDelegate?.updateReview()
                       
                        
                    })
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //서버 연결 실패
                    print("서버 연결에 실패하였습니다.")
                }
                
            }
    }
    
}
