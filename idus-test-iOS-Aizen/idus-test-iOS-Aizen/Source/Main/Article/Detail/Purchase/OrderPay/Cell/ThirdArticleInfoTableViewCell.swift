//
//  ThirdArticleInfoTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

class ThirdArticleInfoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var underTitleText: UILabel!
    @IBOutlet weak var titleText: UIButton!
    
    @IBOutlet weak var articlePriceText: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
