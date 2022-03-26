//
//  MyAccountTabTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import UIKit

protocol MyProfileProtocol{
    func moveMyAccountSetting()
}

class MyAccountTabTableViewCell: UITableViewCell {

    var delegate : MyProfileProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //내 계정 정보 클릭 리스너
    @IBAction func tapMyAccountBtn(_ sender: UIButton) {
        delegate!.moveMyAccountSetting()
    }
}
