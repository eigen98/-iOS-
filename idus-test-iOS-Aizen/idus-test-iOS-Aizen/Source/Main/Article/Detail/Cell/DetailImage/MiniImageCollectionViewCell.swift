//
//  MiniImageCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit



//작품 상세페이지의 작품 이미지 앨범의 컨트롤러(미리보기, 작은 이미지)
class MiniImageCollectionViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var miniCollectionView: UICollectionView!
    //임시 데이터
    var tempData = TempPhoto.createData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.miniCollectionView.dataSource = self
        self.miniCollectionView.delegate = self
        
        //셀 nib등록
        let miniNib = UINib(nibName: "MiniCell", bundle: nil)
        self.miniCollectionView.register(miniNib, forCellWithReuseIdentifier: "MiniCell")
        
        
    }

}
extension MiniImageCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    //섹션의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniCell", for: indexPath) as? MiniCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
