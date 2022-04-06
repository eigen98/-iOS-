//
//  ReviewDeleteViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/05.
//

import UIKit

class ReviewDeleteViewController: UIViewController {

    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var purchasedItem: UILabel!
    
    @IBOutlet weak var reviewContentText: UILabel!
    
    @IBOutlet weak var firstStar: UIImageView!
    
    @IBOutlet weak var secondStar: UIImageView!
    
    @IBOutlet weak var thirdStar: UIImageView!
    
    @IBOutlet weak var fourthStar: UIImageView!
    
    @IBOutlet weak var FifthStar: UIImageView!
    
    @IBOutlet weak var modifyBtn: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    var starArray : [UIImageView] = []
    
    var dataManager = ReviewDataManager()
    
    var reviewEntity : ReviewEntity? = nil
    var star : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nameText.text = self.reviewEntity?.name
        
        self.reviewContentText.text = self.reviewEntity?.content
        self.star = self.reviewEntity!.star
        initStar()
        starProcessing()
        
      
        
        
    }
    

    //뒤로가기 버튼 리스너
    @IBAction func tapBackBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    //삭제하기 버튼 리스너
    @IBAction func tapDeleteReviewBtn(_ sender: UIButton) {
        self.presentAlert(title: "", message: "등록하신 구매후기를 삭제 하시겠습니까? 한 번 삭제할 경우 다시 작성이 불가능합니다.", isCancelActionIncluded: true, preferredStyle: .alert, handler: {action in
            
            self.dataManager.reviewDelete(workReviewId: self.reviewEntity!.workReviewId, delegate: self)
        })
    }
    
    
    func starProcessing(){
        
       
        
        if star != nil {
            switch star {
            case  0..<1 :
                starCommander(howMany: 0)
                
            case  1..<2 :
                starCommander(howMany: 1)
                
            case  2..<3 :
                starCommander(howMany: 2)
              
            case  3..<4 :
                starCommander(howMany: 3)
            
            case  4..<5 :
                starCommander(howMany: 4)
                
                
                
            default:
                starCommander(howMany: 5)
            }
        }
    }
    
    func initStar(){
        self.starArray = [
        
            firstStar,
            secondStar,
            thirdStar,
            fourthStar,
            FifthStar
        ]
    }
    
    //채워질 별 효과 적용
    func starCommander(howMany : Int){
        print("별 변환(\(howMany)")
        
        for i in 0...4{
            let star = self.starArray[i]
            if i <= howMany-1{
                print("채우기")
               
                var image = UIImage(named: "img_full_star")
                star.image = image
                    
                    
               
                
            }else {
                star.image = UIImage(named: "img_empty_star")
            }
        }
        
        
    }
    

}
