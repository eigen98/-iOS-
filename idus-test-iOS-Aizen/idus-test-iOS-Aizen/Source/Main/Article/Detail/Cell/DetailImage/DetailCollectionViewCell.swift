//
//  DetailCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit



//상세화면의 테이블 뷰 안의 콜렉션 뷰에 네트워크 통신을 통해받은 데이터를 넘겨주는 프로토콜

/*
 테이블뷰 생성 -> 컬렉션 뷰 생성 된 후 데이터가 테이블뷰에 업데이트 되어 컬렉션뷰에는 사진이 나타나지 않게 되어 통신이 끝난 후
 해당 프로토콜의 메소드를 호출하여 컬렉션뷰를 업데이트하여 사진이 보이도록 함.
 딜리게이트 패턴
 */
protocol CollectionInTableProtocol{
    //상세화면 뷰에서 네트워크 통신이 완료되었을 때 다시 데이터를 로드 하는 메소드
    func transferDataInCollection(data : [String])
}
/*
 앨범을 넘길 때!마다 미니 앨범 페이지컨트롤러가 동기화되도록 하기위한 프로토콜 (옵저버 패턴)
 */
protocol AlbumListener{
    var observers : [AlbumPageObserver] { get set }
    func addObserver(observer : AlbumPageObserver)
    func deleteObserver(observer : AlbumPageObserver)
    func notify(pageIndex : Int)
}
protocol MiniListener{
    var observers : [MiniPageObserver] { get set }
    func addObserver(observer : MiniPageObserver)
    func deleteObserver(observer : MiniPageObserver)
    func notify(pageIndex : Int)
}
//옵저버
protocol AlbumPageObserver { //앨범을 관찰
    var who : String {get set}
    func updateAlbum(pageIndex : Int) -> Int
}
//
// 옵저버 패턴을 통해 변화한 페이지를 감지하고 딜리게이트 패턴을 통해 전달
//딜리게이트 패턴을 위한 프로톸콜
protocol AlbumPageDelegate{// 앨범으로 전달
    func pagingFromDetail(nowPage : Int)
}

protocol MiniPageObserver{// 미니앨범을 관찰?
    var who : String {get set}
    func updateMini(pageIndex : Int) -> Int
}
protocol MiniPageDelegate{//미니 앨범으로 전달
    func pagingFromDetail(nowPage : Int)
}


//작품 상세 화면의 작품 이미지 넘겨보기
class DetailCollectionViewCell: UITableViewCell, CollectionInTableProtocol, MiniPageDelegate{
    func pagingFromDetail(nowPage: Int) {
        //미니앨범을 눌러서 이동한 경우
        isFromMini = true
        print("앨범에서 확인한 미니앨범의 페이지는 \(nowPage)")
        self.currentCellIndexPath = [0,nowPage]
        self.imageCollectionView.scrollToItem(at: [0,nowPage] , at: .left ,  animated: true)
        self.imageCollectionView.reloadData()
        
    }
    var isFromMini = false
    
    var currentCellIndexPath : IndexPath = [0,0]
    
    
    //옵저버 패턴 구현
    
    var observers: [MiniPageObserver] = [MiniPageObserver]()
    
    
//    var previousIndexRow = 0
//    var previousDelta = 0
   
    var albumPagingDelegate : AlbumPageDelegate? = nil
    
//    func updatePage()
    
   
    
    
    
    func transferDataInCollection(data : [String]) {
        self.detailImgList = data
        imageCollectionView.reloadData()
    }
    
    



    
    
    
   
    
    
    
    
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
        
        print(" album count is \(detailImgList?.count)")
        let imgNIB = UINib(nibName: "DetailCell", bundle: nil)
        self.imageCollectionView.register(imgNIB, forCellWithReuseIdentifier: "DetailCell")
        
        imageCollectionView.reloadData()
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
        
        let url = URL(string: self.detailImgList?[indexPath.row] ?? "")!
        print("album url is = \(self.detailImgList?[indexPath.row])")
        
        //Mark : 궁금증
        //왜 스크롤 방향이 바뀌면 인덱스가 3 크거나 3작아질까?
        //indexPath.row - previousIndexRow 증가할 땐 양수/ 감소할 땐 음수 이므로
        
        //if (indexPath.row - previousIndexRow)
        // 이번에 증가했고 지난 턴에 감소 했다면
//        print("변환 전 indexPath.row = \(indexPath.row)")
//        if (indexPath.row - previousIndexRow) > (previousDelta){
//            // 변화량이 반대가 된 상황이라면
//            print("현재 페이지는 \(indexPath.row - 3 )")
//        }else if (indexPath.row - previousIndexRow) < (previousDelta){
//            print("현재 페이지는 \(indexPath.row + 3 )")
        // -> 이렇게하면 재활용되는 셀이 각각 앞뒤로 있어서 꼬이게 되는 것 같음 별로 안 좋음 차라리 스크롤 감속될 때 호출하는 게 나음
//        previousIndexRow = indexPath.row //끝나면서 이전 페이지로 초기화
//        print("변환 후 indexPath.row = \(indexPath.row)")
//        previousDelta = indexPath.row - previousIndexRow 끝나면서 이전 변화량 초기화
    
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
    //앨범을 통해 움직이는 경우 true
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.isFromMini = false
    }
    //현재 보고있는 앨범의 셀과 미니 앨범 사진의 동기화를 위해 사용
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            print("notify(pageIndex: nowPage) = \(nowPage)")
            if isFromMini == false{ //미니앨범을 눌러서 발생한 경우 페이지 관찰 안함.
                notify(pageIndex: nowPage)
            }
            
            
        }
    
}
//extension DetailCollectionViewCell : UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        //단위 셀 하나의 가로 크기
//        let unitWidth = scrollView.bounds.size.width
//        //contentOffset => 스크롤뷰에서 해당 방향으로 움직인 거리 프로퍼티 (왜 굳이 2로 나누지 근데?)
//        let x = scrollView.contentOffset.x + (unitWidth/2)
//        let nextPage = Int(x/unitWidth)
//        //다음 페이지가 되었을 때 미니 앨범도 넘어가도록 메소드 호출
//        if CGFloat(nextPage) == x {
//            print("page change \(nextPage)")
//            notify(pageIndex: nextPage)
//        }
//
//    }
//}
extension DetailCollectionViewCell : MiniListener{
    //옵저버 패턴 구현
    
    
    func addObserver(observer: MiniPageObserver) {
        self.observers.append(observer)
    }
    func deleteObserver(observer: MiniPageObserver) {
    
        if let index = self.observers.firstIndex(where: { $0.who == observer.who}){
            self.observers.remove(at: index)
        }
    }
    func notify(pageIndex: Int) {
        
        for observer in observers {
        
            observer.updateMini(pageIndex: pageIndex)

        }
        
    }
}

