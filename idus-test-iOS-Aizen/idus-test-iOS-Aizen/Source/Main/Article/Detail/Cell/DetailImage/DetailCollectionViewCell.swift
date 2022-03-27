//
//  DetailCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit



//작품 상세 화면의 작품 이미지 넘겨보기
class DetailCollectionViewCell: UITableViewCell{
    
    //앨범에 들어갈 사진 URL배열
    var detailImgList : [String]? = nil

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //셀 등록 NIB등록
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        let imgNIB = UINib(nibName: "DetailCell", bundle: nil)
        self.imageCollectionView.register(imgNIB, forCellWithReuseIdentifier: "DetailCell")
        
        
        //스크롤 바 안 보이기
        //한장씩 넘어가게 만들기
        
    }
    
    
    
    
    

}
extension DetailCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate{
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.detailImgList?.count ?? 0
    }
    //셀 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCell else { return UICollectionViewCell() }
        
        var url = URL(string: self.detailImgList?[indexPath.row] ?? "")!
        cell.detailCellImage.load(url: url)//해당 url의 사진 로드
        return cell
    }
    
    //사이즈
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.imageCollectionView.frame.width
        let height = self.imageCollectionView.frame.height
        let itemsPerRow :CGFloat = 1
        let widthPadding = sectionInsets.left * (itemsPerRow+1)
        let itemsPerColumn : CGFloat = 1
        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        let cellHeight = (height - heightPadding) / itemsPerColumn
        
        //return CGSize(width: cellWidth, height: cellHeight)
        debugPrint(width)
        print("width = \(width) ")
        return CGSize(width: self.imageCollectionView.frame.size.width  , height:  self.imageCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAt  section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
