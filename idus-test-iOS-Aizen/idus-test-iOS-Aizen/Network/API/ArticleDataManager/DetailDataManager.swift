//
//  DetailDataManager.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation
import Alamofire

//상세화면
class DetailDataManager{
    
    
    
    
    //작품 상세화면 조회
    
    func getDetailArticle(delegate: DetailViewController, articleId : Int) {
        //상세조회 api url
        let url = "\(Constant.BASE_URL)/app/works/\(articleId)"
        //let url = "http://prod.idusb.shop:9000/app/works/\(articleId)"
        //로컬에 저장된 jwt토큰
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        print("detail ID is = \(articleId)")
        
        //"Content-Type":"application/json",
        var header: HTTPHeaders = [ ]
        if jwt != nil {
        header = ["X-ACCESS-TOKEN" : jwt!  ]
        }else {
            
           
        }
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: DetailResponse.self) { response in
                switch response.result {
                case .success(let response): //서버 정상
                    if(response.isSuccess != false){
                        //
                        print("detail response = \(response.code)" )
                        print(" Detail isSuccess= \(response.isSuccess)")
                        print("Detail = \(response.result.workId)")
                        print("Detail = \(response.result.imgs.last!)")
                        delegate.didSuccessGetDetail(response: response)
                        
                    }else {
                        //프로필 조회 불가
                        switch response.code {
                        case 4000 :
                            print("데이터베이스 연결에 실패하였습니다.")
                        case 2002 :
                            print("유효하지않은 JWT입니다.")
                        case 3014 :
                            print("없는 아이디거나 비밀번호가 틀립니다.")
                        default:
                            print("실패하였습니다.")
                        }
                        
                    }
                case .failure(let error): //서버 연결 실패
                    print(error.localizedDescription)
                    print("디테일 조회 실패")
                    delegate.presentAlert(title: "서버 연결에 실패하였습니다.")
                }
            }
    }
    
}


