//
//  DetailViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit
import XLPagerTabStrip
import MaterialComponents


class DetailViewController: UIViewController, StartBuyProtocol, AlbumPageObserver, MiniPageObserver {
    
    
   
    
    
    //옵저버 패턴구현
    var who: String = "DetailView"
    func updateMini(pageIndex: Int) -> Int {
        print("현재 상세화면에서 관찰한 미니앨범의 페이지는 \(pageIndex)")
        //옵저버로 관찰한 앨범 페이지를 딜리게이트로 미니 앨범으로 전달
        updatePageToMini(nowPage: pageIndex)
        
        return pageIndex
    }
    func updateAlbum(pageIndex: Int) -> Int {
        print("현재 상세화면에서 관찰한 앨범의 페이지는 \(pageIndex)")
        //옵저버로 관찰한 미니앨범 페이지를 딜리게이트로 앨범으로 전달
        updatePageToAlbum(nowPage: pageIndex)
        
        return pageIndex
    }
    
    //페이지 업데이트 딜리게이트
    var albumPagingDelegate : AlbumPageDelegate? = nil
    var miniPagingDelegate : MiniPageDelegate? = nil
    
    func updatePageToMini(nowPage : Int){ //앨범에서 보고있는 페이지를 Mini로 전달
        self.albumPagingDelegate?.pagingFromDetail(nowPage: nowPage)
        
    }
    func updatePageToAlbum(nowPage : Int){ //미니에서 누른 페이지를 앨범으로 전달
        self.miniPagingDelegate?.pagingFromDetail(nowPage : nowPage)
    }

    
    
    //딜리게이트 패턴 (네트워크 통신 데이터 전달을 위한 딜리게이트)
    var delegate : CollectionInTableProtocol? = nil
    
    var isBuying : Bool = false
    
    func isClickedBtnBuy() {
        self.isBuying = true
        print("isBuying 변경 \(isBuying)")
        
        DispatchQueue.main.async( execute: {
            self.moveDirectBuy()
        })
        }
        
    
    

    @IBOutlet weak var detailTableView: UITableView!
    
    //데이터 매니저
    let dataManager = DetailDataManager()
    //서버에서 받을 작품 상세 데이터
    var detailArticleData : ArticleDetailEntity? = nil
    //이전 화면에서 받아올 작품 아이디
    var articleIdThis : Int? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isBuying == false{
            
        }
        self.dataManager.getDetailArticle(delegate: self, articleId: articleIdThis!)
    }
    func moveDirectBuy(){
        if isBuying == true{
            print("구입중인가? \(isBuying)")
            definesPresentationContext = true
//            let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
            guard let directBuyVC = storyboard?.instantiateViewController(withIdentifier: "DirectBuyViewController") as? DirectBuyViewController else { return
                print("DirectBuy 생성 실패")
            }
            
            //self.navigationController?.pushViewController(directBuyVC, animated: true)
            directBuyVC.modalPresentationStyle = .fullScreen
            self.present(directBuyVC, animated: true, completion: nil)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
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
        
            
        
           
        self.detailArticleData = response.result
          
        print("detailArticleData is \(detailArticleData?.workId)")
       
        
        self.detailTableView.reloadData()
        
    }
    //Mark : 구입하기
    //구입하기 버튼 클릭 리스너
    @IBAction func tapPurchaseBtn(_ sender: UIButton) {
        print("구입하기 버튼 클릭")
        //바텀 시트로 쓰일 뷰 컨트롤러
        let bottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "DetailBottomSheetVC") as! DetailBottomSheetViewController
        bottomSheetVC.buyDelegate = self //구매하기 누른 뒤 데이터 전달을 위한 딜리게이트
        
        //MDC 바텀 시트로 설정
        let bottomSheet : MDCBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet.delegate = self
        present(bottomSheet,animated: true, completion: nil)
        
        //보여지는 정도를 조절
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 550
    }
    @IBAction func tapBackBtn(_ sender: UIBarButtonItem) {
       
        let mainController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabbarController")
        changeRootViewController(mainController)
        print("back to the main")
        self.dismiss(animated: true, completion: nil)
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
        }else if section == 1 || section == 2 || section == 4 || section == 5 {
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
                print("detail controller's \(self.detailArticleData?.workId)")
                print("detail controller's \(self.detailArticleData?.imgs.count)")
                //업데이트된 데이터를 셀에 업데이트해주기 위한 딜리게이트
                self.delegate = cell
                //페이지 동기화를 위한 옵저버 추가(앨범을 관찰)
                cell.addObserver(observer: self)
                //옵저버가 관찰한 미니앨범의 페이지를 앨범으로 전달하기위한 딜리게이트
                //self.miniPagingDelegate = cell
                
                self.delegate?.transferDataInCollection(data: self.detailArticleData?.imgs ?? [])
                
                
                return cell
            }
            
        case 1 ://미니 앨범
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MiniImageCollectionViewCell") as? MiniImageCollectionViewCell {
                print("detail controller's \(self.detailArticleData?.imgs.count)")
                cell.detailImgList = self.detailArticleData?.imgs
                self.delegate = cell
                self.delegate?.transferDataInCollection(data: self.detailArticleData?.imgs ?? [])
                //옵저버가 관찰한 앨범의 페이지를 미니앨범으로 전달하기위한 딜리게이트
                self.albumPagingDelegate = cell
                //페이지 동기화를 위한 옵저버 추가(미니앨범을 관찰)
                cell.addObserver(observer: self)
                
                
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
         return 265
     case 4:
         return 50
     case 5:
         return 251
     case 6:
         return 235
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

extension DetailViewController : MDCBottomSheetControllerDelegate{
    func bottomSheetControllerDidDismissBottomSheet(_ controller: MDCBottomSheetController) {
        print("바텀 시트 닫힘")
        self.moveDirectBuy()
    }
    func bottomSheetControllerStateChanged(_ controller: MDCBottomSheetController, state: MDCSheetState) {
        
    
    }
}

