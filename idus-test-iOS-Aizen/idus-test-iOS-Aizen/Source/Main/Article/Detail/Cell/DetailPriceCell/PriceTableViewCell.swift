//
//  PriceTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/24.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameText: UIButton!
    
    @IBOutlet weak var articleNameText: UILabel!
    
    @IBOutlet weak var priceText: UILabel!
    
    @IBOutlet weak var deleveryFee: UILabel!
    
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    
    @IBOutlet weak var rateText: UIButton!
    
    
    //넘겨받을 데이터
    var articleData : ArticleDetailEntity? = nil
    
    var starArray : [UIImageView]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initStar()
        
        
        
        
    }
    
    func processing(){
        artistNameText.setTitle("데일리 쥬얼리", for: .normal)
        if articleData != nil{
            articleNameText.text = articleData!.title
            priceText.text = "\(articleData!.price)원"
        }
       
        
        if articleData?.star != nil {
            switch articleData!.star {
            case  0..<1 :
                starCommander(howMany: 0)
                rateText.setTitle("0.0", for: .normal)
            case  1..<2 :
                starCommander(howMany: 1)
                rateText.setTitle("1.0", for: .normal)
            case  2..<3 :
                starCommander(howMany: 2)
                rateText.setTitle("2.0", for: .normal)
            case  3..<4 :
                starCommander(howMany: 3)
                rateText.setTitle("3.0", for: .normal)
            case  4..<5 :
                starCommander(howMany: 4)
                rateText.setTitle("4.0", for: .normal)
                
                
            default:
                return
            }
        }
    }
    
    func initStar(){
        self.starArray = [
        
            firstStar,
            secondStar,
            thirdStar,
            fourthStar,
            fifthStar
        ]
    }
    
    //채워질 별 효과 적용
    func starCommander(howMany : Int){
        print("별 변환(\(howMany)")
        
        for i in 0...4{
            let star = self.starArray![i]
            if i <= howMany-1{
                print("채우기")
               
                var image = UIImage(named: "img_full_star")
                star.image = image
                    
                    
               
                
            }else {
                star.image = UIImage(named: "img_empty_star")
            }
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
