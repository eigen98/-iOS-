//
//  CommentListTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/30.
//

import UIKit

class CommentListTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameText: UILabel!
    
    @IBOutlet weak var userCommentText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
