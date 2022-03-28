//
//  DetailBottomSheetTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

class DetailBottomSheetTableViewCell: UITableViewCell {

    //테두리 설정을 위한 +-버튼 컨테이너
    @IBOutlet weak var upDownBtnContainer: UIView!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var numberingText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initUI(){
        upDownBtnContainer.layer.borderWidth = 2
        upDownBtnContainer.layer.borderColor = UIColor.separator.cgColor
        upDownBtnContainer.layer.cornerRadius = 5
        
        numberingText.layer.borderWidth = 2
        numberingText.layer.borderColor = UIColor.separator.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
