//
//  MyInfoNoLoginTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/21.
//

import UIKit
protocol NologinProtocol{
    func moveLoginPage()
}

class MyInfoNoLoginTableViewCell: UITableViewCell {

    var noLoginDelegate : NologinProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func moveLoginPageBtn(_ sender: UIButton) {
        noLoginDelegate?.moveLoginPage()
        
    }
}
