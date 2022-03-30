//
//  MiniImageCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit



//작품 상세페이지의 작품 이미지 앨범의 컨트롤러(미리보기, 작은 이미지)
class MiniImageCollectionViewCell: UITableViewCell, CollectionInTableProtocol, AlbumPageObserver, AlbumPageDelegate{
    
    
    //옵저버 패턴 구현
    var observers: [AlbumPageObserver] = [AlbumPageObserver]()
    
    func pagingFromDetail(nowPage: Int) {
        print("미니앨범에서 확인한 앨범의 페이지는 \(nowPage)")
        self.currentCellIndexPath = [0,nowPage]
        self.miniCollectionView.scrollToItem(at: [0,nowPage] , at: .left ,  animated: true)
        self.miniCollectionView.reloadData()
        
    }
    
    var currentCellIndexPath : IndexPath = [0,0]
    
    
    func pagingFromMiniToAlbum(selectedPage : Int){
        notify(pageIndex: selectedPage)
    }
    
    
   
    
    //옵저버 패턴 -> 현재 미니앨범의 페이지 업데이트 정보 전달
    var who: String = "miniAlbum"
    func updateAlbum(pageIndex: Int) -> Int {
        print("\(who)의 페이지는 \(pageIndex)")
        return pageIndex
    }
    
    
    
    //딜리게이트 함수 구현
    func transferDataInCollection(data: [String]) {
        self.detailImgList = data
        self.miniCollectionView.reloadData()
    }
    

   
    
    
    
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
        if indexPath == self.currentCellIndexPath {
            cell.cellBackGround.backgroundColor = UIColor.red
        }else{
            cell.cellBackGround.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
   
    
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAt  section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        notify(pageIndex: indexPath.row)
    }
    
    
}
extension MiniImageCollectionViewCell : AlbumListener{
    //옵저버 패턴 구현
    
    
    func addObserver(observer: AlbumPageObserver) {
        self.observers.append(observer)
    }
    func deleteObserver(observer: AlbumPageObserver) {
    
        if let index = self.observers.firstIndex(where: { $0.who == observer.who}){
            self.observers.remove(at: index)
        }
    }
    func notify(pageIndex: Int) {
        
        for observer in observers {
        
            observer.updateAlbum(pageIndex: pageIndex)

        }
        
    }
}

