//
//  CommentListTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/30.
//

import UIKit

protocol CommentDeleteProtocol {
    func removeComment(workCommentId : Int, cell : CommentTableViewCell)
}

class CommentListTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameText: UILabel!
    
    @IBOutlet weak var userCommentText: UILabel!
    
    @IBOutlet weak var deleteCommentBtn: UIButton!
    
    var commentDeleteDelegate : CommentDeleteProtocol? = nil
    var cell : CommentTableViewCell? = nil
    
    var myName = UserDefaults.standard.string(forKey: "name")
    var commentData : CommentResponse? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //댓글 삭제 버튼 리스너
    @IBAction func tapDeleteCommentBtn(_ sender: UIButton) {
        commentDeleteDelegate?.removeComment(workCommentId: commentData!.workCommentId, cell: cell!)
    }
}
