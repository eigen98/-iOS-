//
//  TabbarTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/25.
//

import UIKit

//상단 탭바
class TabbarTableViewCell: UITableViewCell {

    let maxHeight: CGFloat = 100.0 //headerView의 최대 높이값
    let minHeight: CGFloat = 100.0 //headerVIew의 최소 높이값
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
