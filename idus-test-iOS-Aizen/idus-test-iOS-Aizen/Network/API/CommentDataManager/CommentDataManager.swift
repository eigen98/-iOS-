//
//  CommentDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/30.
//

import Foundation
import Alamofire
//댓글 api요청 -> Post
class CommentDataManager{
    let keyChainManager = KeyChainManager.shared
    
    //댓글 달기 api -> Post 방식 (/app/works/comment/workCommentId)
    func commentPost(_ parameters : CommentRequest, delegate: CommentTableViewCell){
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        print("jwt is = \(jwt!)")
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        AF.request("\(Constant.BASE_URL)/app/works/comment", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header) //엔티티 ->Json 인코딩
            .responseDecodable(of : CommentWritingResponse.self){ response in
                //반환 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
                switch response.result{
                case .success(let response)://서버 연결 성공
                    
                   
                    print("댓글 쓰기 성공 ")
                    print("댓글 쓴 작품 \(parameters.workId)")
                    
                
                    print("\(response.result?.comment)")
                    // 현재 가지고 있는 데이터의 맨처음부터 출력되므로 맨 최신의 댓글을 처음에 대입해야함
                    var temp : [CommentResponse] = delegate.commentData.reversed()
                    temp.append(response.result!)
                    delegate.commentData = temp.reversed()
                    
                    delegate.self.commentListTableView.reloadData()
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //서버 연결 실패
                    print("서버 연결에 실패하였습니다.")
                }
                
            }
        
        
        
        
    }
    
    //댓글 삭제 api
    //댓글 삭제 api -> GET 방식 (/app/works/comment/workCommentId)
    func commentDelete(workCommentId : Int , delegate: DetailViewController, cell : CommentTableViewCell){
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        print("jwt is = \(jwt!)")
        let header: HTTPHeaders = ["X-ACCESS-TOKEN" : jwt!  ]
        
        
        AF.request("\(Constant.BASE_URL)/app/works/comment/\(workCommentId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header) //엔티티 ->Json 인코딩
            .responseDecodable(of : CommentDeleteResponse.self){ response in
                //반환 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
                switch response.result{
                case .success(let response)://서버 연결 성공
                    
                   
                    print("댓글 삭제 성공 ")
                    print("삭제한 댓글 id = \(response.result.deleteId)")
                    
                
                    print("\(response.result.result)")
                    delegate.dataManager.getDetailArticle(delegate: delegate, articleId: delegate.detailArticleData!.workId)
                    delegate.detailTableView.reloadData()
                    cell.commentListTableView.reloadData()
                   
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //서버 연결 실패
                    print("서버 연결에 실패하였습니다.")
                }
                
            }
        
        
    
    
    }
    
    
    
    
    
}
