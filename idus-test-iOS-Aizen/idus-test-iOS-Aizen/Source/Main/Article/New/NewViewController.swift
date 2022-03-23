//
//  NewViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip

struct Article{
    let articleName : String
    let belong : String
    let image : UIImage!
    let isZzim : Bool
    
    static func createData() -> [Article] {
        //임시 데이터
        return
        [
            Article(articleName: "이미지만 볼게요", belong: "이미지만 볼게요", image: UIImage(named: "img_sample1"), isZzim: false),
            Article(articleName: "아이오아이", belong: "ABC마트", image: UIImage(named: "img_sample1"), isZzim: false),
            Article(articleName: "아이오아이", belong: "ABC마트", image: UIImage(named: "img_sample1"), isZzim: false),
            Article(articleName: "아이오아이", belong: "ABC마트", image: UIImage(named: "img_sample1"), isZzim: false),
            Article(articleName: "아이오아이", belong: "ABC마트", image: UIImage(named: "img_sample1"), isZzim: false)
            
            
        ]
    }
}
class NewViewController: UIViewController , IndicatorInfoProvider {
    var tabName: String = ""

    //컬렉션 뷰에 나타낼 작품들
    var cellData : [Article] = Article.createData()
    
 
    //컬렉션 뷰
    @IBOutlet weak var newCollectionView: UICollectionView!
    
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
    
    
    
}

extension NewViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    //섹션 의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cellData.count-1
    }
    
    //셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cellData[indexPath.row].articleName == "이미지만 볼게요"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlyImageCollectionViewCell", for: indexPath)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath)
            return cell
        }
    }
    
    
    
}
