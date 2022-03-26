//
//  MyInfoProfileTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/21.
//

import UIKit
//설정 버튼 클릭 구현 프로토콜
protocol SettingProtocol : AnyObject{
    func clickedSettingBtn()
}

class MyInfoProfileTableViewCell: UITableViewCell {

    var delegate : SettingProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //설정 버튼 클릭 리스너
    @IBAction func tapSettingBtn(_ sender: UIButton) {
        self.delegate?.clickedSettingBtn()
    }
}
