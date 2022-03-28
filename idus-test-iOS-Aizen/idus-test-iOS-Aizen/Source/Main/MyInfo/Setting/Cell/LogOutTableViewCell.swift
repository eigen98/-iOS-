//
//  LogOutTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import UIKit

protocol LogoutProtocol{
    func logOutNow()
}
class LogOutTableViewCell: UITableViewCell {

    var delegate : LogoutProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //로그아웃
    @IBAction func tapLogoutBtn(_ sender: UIButton) {
        print("로그아웃 버튼 탭")
        delegate?.logOutNow()
        
    }
}
