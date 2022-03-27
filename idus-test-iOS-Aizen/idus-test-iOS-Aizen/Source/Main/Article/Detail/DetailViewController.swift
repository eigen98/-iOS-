//
//  DetailViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit
import XLPagerTabStrip

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    //데이터 매니저
    let dataManager = DetailDataManager()
    //서버에서 받을 작품 상세 데이터
    var detailArticleData : ArticleDetailEntity? = nil
    //이전 화면에서 받아올 작품 아이디
    var articleIdThis : Int? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dataManager.getDetailArticle(delegate: self, articleId: articleIdThis!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initNavi()

        //네비게이션 바 투명 처리
//        initNavi()
//        let bar : UINavigationBar! = self.navigationController?.navigationBar
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//
//        bar.shadowImage = UIImage()
//        bar.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
        
        //테이블 뷰 배경
        self.detailTableView.backgroundColor = .systemGray6
        
        detailTableView.dataSource  = self
        detailTableView.delegate = self
        
        //MARK : nib등록
        //사진 넘겨보기 셀
        let photoNib = UINib(nibName: "DetailCollectionViewCell", bundle: nil)
        self.detailTableView.register(photoNib, forCellReuseIdentifier: "DetailCollectionViewCell")
        
        //작은 사진 미리보기 뷰 셀
        let miniPhotoNib = UINib(nibName: "MiniImageCollectionViewCell", bundle: nil)
        self.detailTableView.register(miniPhotoNib, forCellReuseIdentifier: "MiniImageCollectionViewCell")
        
        
        //배송 정보 셀
        let postNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        self.detailTableView.register(postNib, forCellReuseIdentifier: "PostTableViewCell")
        
        //상단 탭바 셀
        let tabbarNib = UINib(nibName: "TabbarTableViewCell", bundle: nil)
        self.detailTableView.register(tabbarNib, forCellReuseIdentifier: "TabbarTableViewCell")
        
        //작품 가격 정보
        let priceNib = UINib(nibName: "PriceTableViewCell", bundle: nil)
        self.detailTableView.register(priceNib, forCellReuseIdentifier: "PriceTableViewCell")
        
        //작품 정보 셀
        let articleInfoNib = UINib(nibName: "ArticleInfoTableViewCell", bundle: nil)
        self.detailTableView.register(articleInfoNib, forCellReuseIdentifier: "ArticleInfoTableViewCell")
        
        //버튼 뷰 셀
        let infoButtonNib = UINib(nibName: "InfoButtonTableViewCell", bundle: nil)
        self.detailTableView.register(infoButtonNib, forCellReuseIdentifier: "InfoButtonTableViewCell")
        
        //구매후기 셀
        let reviewNib = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        self.detailTableView.register(reviewNib, forCellReuseIdentifier: "ReviewTableViewCell")
        
        //댓글 셀
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        self.detailTableView.register(commentNib, forCellReuseIdentifier: "CommentTableViewCell")
        
        //작가님 정보 셀
        let artistInfoNib = UINib(nibName: "ArtistInfoTableViewCell", bundle: nil)
        self.detailTableView.register(artistInfoNib, forCellReuseIdentifier: "ArtistInfoTableViewCell")
    }
    
    //작품 상세화면 요청 성공시 화면 업데이트 메소드
    func didSuccessGetDetail(response : DetailResponse){
        print("didSuccess")
        self.detailArticleData = response.result?[0] ?? nil
        self.detailTableView.reloadData()
        
    }
    
    //디테일 네비게이션 바 (뒤로가기, 작품이름, 검색, 작품, 장바구니)
    func initNavi(){
        navigationController?.hidesBarsOnSwipe = false
        let searchIcon = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(searchSth))
        let homeIcon = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveHome))
        let cartIcon = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveCart))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveHome))
        
        navigationItem.rightBarButtonItems = [ cartIcon, homeIcon, searchIcon]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        print(UITabBarController().tabBar.frame.height)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // 내비게이션 바 버튼
    @objc func searchSth() {
        
    }

    @objc func moveHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func moveCart() {
        
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let basketViewController = detailStoryboard.instantiateViewController(identifier: "BasketViewController")
        let vc = UINavigationController(rootViewController: basketViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController : UITableViewDataSource, UITableViewDelegate {
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //헤더 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //첫번째 섹션의 헤더 공간 없애기
        if section == 0 {
            return nil
        }else if section == 1 {
            return nil
        }else if section == 2{
            return nil
        }
           return " "
    }
    
    //각각의 셀 섹션마다 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: //사진 앨범 셀
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCollectionViewCell") as? DetailCollectionViewCell {
                cell.detailImgList = self.detailArticleData?.imgs
                return cell
            }
            
        case 1 ://미니 앨범
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MiniImageCollectionViewCell") as? MiniImageCollectionViewCell {
                return cell
            }
            
        case 2 : //작품 가격 및 정보
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PriceTableViewCell") as? PriceTableViewCell {
                return cell
            }
            
        case 3 : // 배송 정보
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell {
                return cell
            }
        case 4 : // 상단 탭바
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TabbarTableViewCell") as? TabbarTableViewCell {
                return cell
            }
        case 5 : // 버튼 탭들
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfoButtonTableViewCell") as? InfoButtonTableViewCell {
                return cell
            }
            
        case 6 : //작품 정보x
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleInfoTableViewCell") as? ArticleInfoTableViewCell {
                return cell
            }
            
        case 7 : //후기정보
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as? ReviewTableViewCell {
                return cell
            }
        case 8 : //댓글
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as? CommentTableViewCell {
                return cell
            }
        case 9 : //작가 님 정보 x
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistInfoTableViewCell") as? ArtistInfoTableViewCell {
                return cell
            }
            
        default:
            return UITableViewCell()
        }
            

        
        return UITableViewCell()
        
    }
    //셀 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     switch indexPath.section {
     case 0: // 사진 페이저
         return 414
     case 1: //미리보기 mini
         return 56
     case 2://
         return 400
     case 3:
         return 240
     case 4:
         return 180
     case 5:
         return 400
     case 6:
         return 400
     case 7:
         return 235
     case 8:
         return 235
     case 9:
         return 235
     default:
         return 0
     
     }

    }
    
    //헤더 크기 줄이기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.3
    }
    
    
}
