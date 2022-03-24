//
//  DetailCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit

struct TempPhoto{
    var name : String
    
    static func createData() -> [TempPhoto]{
        return
        [
            TempPhoto(name: "a"),
            TempPhoto(name: "b"),
            TempPhoto(name: "c"),
            TempPhoto(name: "d"),
        ]
    }
}

//작품 상세 화면의 작품 이미지 넘겨보기
class DetailCollectionViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    //UICollectionView는 UICollectionViewCell과 동시에 상속이 안 됨

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    //임시 데이터
    var tempData = TempPhoto.createData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //셀 등록 NIB등록
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        let imgNIB = UINib(nibName: "DetailCell", bundle: nil)
        self.imageCollectionView.register(imgNIB, forCellWithReuseIdentifier: "DetailCell")
        
        
        
    }
    
    
    
    
    

}
extension DetailCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate{
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tempData.count
    }
    //셀 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
