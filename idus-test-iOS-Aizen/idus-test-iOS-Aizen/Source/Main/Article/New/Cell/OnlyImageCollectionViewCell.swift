//
//  OnlyImageCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/23.
//

import UIKit


class OnlyImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkBoxOnly: UIButton!
    
    var delegate : NewProtocol?
    var isChecked : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tapCheckBox(_ sender: UIButton) {
        delegate?.checkOnlyImg()
        if isChecked == false{
            isChecked = true
            checkBoxOnly.setImage(UIImage(systemName: "checkmark.rectangle.portrait"), for: .normal)
            
        }else {
            isChecked = false
            checkBoxOnly.setImage(UIImage(systemName: "square"), for: .normal)
            
        }
    }
    
}
