//
//  MiniImageCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit



//작품 상세페이지의 작품 이미지 앨범의 컨트롤러(미리보기, 작은 이미지)
class MiniImageCollectionViewCell: UITableViewCell {

    //앨범에 들어갈 사진 URL배열
    var detailImgList : [String]? = nil
    
    @IBOutlet weak var miniCollectionView: UICollectionView!

    
    let sectionInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //섹션의 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.detailImgList?.count ?? 0
    }
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = self.miniCollectionView.frame.width
//        let height = self.miniCollectionView.frame.height
//        let itemsPerRow :CGFloat = 1
//        let widthPadding = sectionInsets.left * (itemsPerRow+1)
//        let itemsPerColumn : CGFloat = 1
//        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//        let cellWidth = (width - widthPadding) / itemsPerRow
//        let cellHeight = (height - heightPadding) / itemsPerColumn
//
//        //return CGSize(width: cellWidth, height: cellHeight)
        
        return CGSize(width: 48.0  , height:  48.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniCell", for: indexPath) as? MiniCell else { return UICollectionViewCell() }
        
        var url = URL(string: self.detailImgList?[indexPath.row] ?? "")!
        cell.miniImageView.load(url: url)//해당 url의 사진 로드
        return cell
    }
    
   
    
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAt  section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
