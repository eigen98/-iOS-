//
//  WriteReviewViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import UIKit
//리뷰를 올리고 올린 데이터를 전달하여 최신화 해주기 위한 프로토콜
protocol ReviewCompleteProtocol{
    func updateReview()
}

class WriteReviewViewController: UIViewController {

    var reviewDelegate : ReviewCompleteProtocol? = nil
    @IBOutlet weak var firstStar: UIButton!
    
    @IBOutlet weak var secondStar: UIButton!
    
    @IBOutlet weak var thirdStar: UIButton!
    
    @IBOutlet weak var forthStar: UIButton!
    
    @IBOutlet weak var fifthStar: UIButton!

    //데이터 매니저
    var dataManger : ReviewDataManager = ReviewDataManager()
    
    //내용 텍스트
    @IBOutlet weak var contentText: UITextField!
    
    //상세페이지에서 넘겨받을 작품 정보
    var articleData : ArticleDetailEntity? = nil
    //각 별을 담을 배열
    var starArray : [UIButton] = [UIButton]()
    
    var starNumbering : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //별 배열에 넣기
        initArrayStar()
        
        // Do any additional setup after loading the view.
    }
    
    //인스턴스화 된 별을 배열에 담아 메소드 실행준비
    func initArrayStar(){
        self.starArray =  [
            firstStar,
            secondStar,
            thirdStar,
            forthStar,
            fifthStar
        ]
    }
    
    //리뷰 등록 버튼 리스너
    @IBAction func uploadMyReview(_ sender: UIButton) {
        var parameterEntity = ReviewRequest(workId: articleData!.workId, content: contentText.text! , star: Float(self.starNumbering) , reviewImg: [""])
        
        //데이터매니저를 통해 업로드
        dataManger.commentPost(parameterEntity, delegate: self)
        
    }
    
    
    
//    // 내비게이션 바 디자인
//    func initNavigationBar() {
//
//
//
//        //오른쪽 상단 네비게이션 바 버튼
//        let buttonView = UIBarButtonItem()
//        let regesterImage = UIImage(named: "img_review_upload_btn")
//        buttonView.image = regesterImage
//        navigationItem.rightBarButtonItem = buttonView
//
//        //왼쪽 뒤로가기 버튼
//        let leftButtonView = UIBarButtonItem()
//        let backImage = UIImage(systemName: "arrow.backward")
//        leftButtonView.image = backImage
//        navigationItem.leftBarButtonItem = leftButtonView
//
//        //가운데 타이틀 설정
//        let titleButtonView = UIBarButtonItem()
//        let titleImage = UIImage(systemName: "img_write_review_title")
//        titleButtonView.image = titleImage
//        navigationItem.leftBarButtonItem = titleButtonView
//
//    }
    
    
    //채워질 별 효과 적용
    func starCommander(howMany : Int){
        print("별 변환(\(howMany)")
        
        for i in 0...4{
            let star = self.starArray[i]
            if i <= howMany-1{
                print("채우기")
                starAnimation(star: star)
                DispatchQueue.main.async {
                    
                    var image = UIImage(named: "img_full_star")
                    star.setImage(image, for: .normal)
                }
                
            }else {
                star.setImage(UIImage(named: "img_empty_star"), for: .normal)
            }
        }
        
        
    }
    //별 애니메이션 효과 메소드
    func starAnimation(star : UIButton){
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.5, animations: ({
                
                star.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                
//                self.commentTextField.transform = CGAffineTransform(scaleX: 1.3, y: 1.0 )
            }), completion: { action in
                UIView.animate(withDuration: 0.5, animations: {
                    star.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
                
            } )
        }
        
    }
    
    @IBAction func tapOneStar(_ sender: UIButton) {
        starCommander(howMany : 1)
        starNumbering = 1
        
    }
    @IBAction func tapTwoStar(_ sender: UIButton) {
        
        //secondStar.imageView?.image = UIImage(named: "img_half_star")
        starCommander(howMany : 2)
        starNumbering = 2
    }
    
    @IBAction func tapThreeStar(_ sender: UIButton) {
//        firstStar.imageView?.image = UIImage(named: "img_full_star")
//        secondStar.imageView?.image = UIImage(named: "img_full_star")
//        thirdStar.imageView?.image = UIImage(named: "img_half_star")
        starCommander(howMany : 3)
        starNumbering = 3
        
    }
    @IBAction func tapFourStar(_ sender: UIButton) {
//        firstStar.imageView?.image = UIImage(named: "img_full_star")
//        secondStar.imageView?.image = UIImage(named: "img_full_star")
//        thirdStar.imageView?.image = UIImage(named: "img_full_star")
//        forthStar.imageView?.image = UIImage(named: "img_half_star")
        starCommander(howMany : 4)
        starNumbering = 4
        
    }
    @IBAction func tapFiveStar(_ sender: UIButton) {
//        firstStar.imageView?.image = UIImage(named: "img_full_star")
//        secondStar.imageView?.image = UIImage(named: "img_full_star")
//        thirdStar.imageView?.image = UIImage(named: "img_full_star")
//        forthStar.imageView?.image = UIImage(named: "img_full_star")
//        forthStar.imageView?.image = UIImage(named: "img_full_star")
        
        starCommander(howMany : 5)
        starNumbering = 5
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
