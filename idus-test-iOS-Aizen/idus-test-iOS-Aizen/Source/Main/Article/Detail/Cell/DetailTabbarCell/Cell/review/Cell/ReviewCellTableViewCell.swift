//
//  ReviewCellTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/31.
//

import UIKit



class ReviewCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var createdAtText: UILabel!
    
    @IBOutlet weak var contentText: UILabel!
    
    
    @IBOutlet weak var firstStar: UIImageView!
    
    @IBOutlet weak var secondStar: UIImageView!
    
    @IBOutlet weak var thirdStar: UIImageView!
    
    @IBOutlet weak var fourthStar: UIImageView!
    
    @IBOutlet weak var fifthStar: UIImageView!
    
    var star : Float = 0
    
    var starArray : [UIImageView]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func processing(){
        
       
        
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
    
    
}
