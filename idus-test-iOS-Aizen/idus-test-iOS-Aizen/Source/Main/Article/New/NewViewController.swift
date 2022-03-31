//
//  NewViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip



class NewViewController: UIViewController , IndicatorInfoProvider, NewProtocol {
    
    let zzimDataManager = ZzimDataManager() //찜 관련 데이터 매니저
    
    func checkOnlyImg() { //이미지만 볼래요 프로토콜 구현 메소드
        print("이미지만 볼래요 메소드 호출")
        
        //체크박스 여부 확인 후 셀 업데이트
        if isCheckedOnly == false{
            isCheckedOnly = true
            
        }else {
            isCheckedOnly = false
        }
        newCollectionView.reloadData()
        
    }
    
    
    func zzimListner(id : Int?) {// 찜 누르기 프로토콜 구현 메소드
        
        print("작품 \(id) 찜")
        
        if id == nil {
            return
        }
        
        let articleID = id
        var index = 0
        //작품 아이디와 같은 데이터 찾기
        var nowIndex = 0
        self.articleData.forEach({it in
            
            if it.workId == articleID {
                index = nowIndex
            }
            nowIndex += 1
        })
        //Mark : Zzim DataManager
        zzimDataManager.zzimStart(delegate: self, articleId: articleID!)
        
        if self.articleData[index].interestStatus == 0 {
            self.articleData[index].interestStatus = 1
            self.newCollectionView.reloadData()
        }else {
            self.articleData[index].interestStatus = 0
            self.newCollectionView.reloadData()
        }
        
    }
    
    
    
    var tabName: String = ""

    var isCheckedOnly : Bool = false

    //받아올 작품 데이터
    var articleData : [NewResult] = [NewResult]()
 
    let dataManager = NewDataManager()
    //컬렉션 뷰
    @IBOutlet weak var newCollectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataManager.getNewArticles(delegate: self)
        (newCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.newCollectionView.delegate = self
        self.newCollectionView.dataSource = self
        
        
        //xib 셀 등록
        let onlyImageXib = UINib(nibName: "OnlyImageCollectionViewCell", bundle: nil)
        
        self.newCollectionView.register(onlyImageXib, forCellWithReuseIdentifier: "OnlyImageCollectionViewCell")
        
        let newXib = UINib(nibName: "NewCollectionViewCell", bundle: nil)
        self.newCollectionView.register(newXib, forCellWithReuseIdentifier: "NewCollectionViewCell")
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
    
    //셀에 보여줄 작품 리스트 초기화
    func didSuccessGetArticles(response : NewResponse){
       
        self.articleData =  response.result ?? [NewResult]()
        self.newCollectionView.reloadData()
    }
    
    
    
}

extension NewViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    //섹션 의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { //첫번 째 섹션의 셀은 하나만 가짐
            return 1
        }else {
            
            return self.articleData.count
        }
        
    }
    
    //셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //첫번째 섹션일 때
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlyImageCollectionViewCell", for: indexPath) as? OnlyImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as? NewCollectionViewCell else { return UICollectionViewCell() }
            //셀 정보 초기화
            cell.delegate = self
            cell.articleName.text = self.articleData[indexPath.row].title
            cell.belong.text = "데이쥬얼리"
            cell.workId = self.articleData[indexPath.row].workId //찜 작품을 식별하기위한 id를 각 셀에 배정
            let url = URL(string : self.articleData[indexPath.row].workImg)
            cell.uiImageView.load(url: url!)
            if self.articleData[indexPath.row].interestStatus == 0 {
                cell.zzimBtn.setImage(UIImage(named: "img_zzim"), for: .normal)
            }else {
                cell.zzimBtn.setImage(UIImage(named: "img_zzim_after"), for: .normal)
            }
            
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
        if indexPath.section == 1{
            if self.isCheckedOnly == true{
                print("이미지만 보기 셀 크기 조절")
                return CGSize(width: 182.0, height: 184.0)
            }else{
                print(" 셀 크기 조절")
                return CGSize(width: 182.0, height: 232.0)
            }
            
        }else {
            return CGSize(width: 414.0, height: 72.0)
        }
    }
    
    
    //셀 선택 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("작품 상세 화면 호출")
        guard let detailController = UIStoryboard(name: "DetailStoryboard", bundle: nil).instantiateViewController(identifier: "DetailViewControllerSB") as? DetailViewController else { return }
        detailController.articleIdThis = articleData[indexPath.row].workId //작품 아이디 전달
        
        changeRootViewController(detailController)
    }
    
    
    
    
}
