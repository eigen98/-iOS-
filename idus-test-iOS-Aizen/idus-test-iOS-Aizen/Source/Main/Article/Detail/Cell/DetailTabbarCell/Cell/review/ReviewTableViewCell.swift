//
//  ReviewTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/25.
//

import UIKit
//셀안에서 버튼을 눌렀을 때 리뷰 작성화면으로 이동하기 위한 프로토콜
protocol MoveReviewProtocol{
    func moveWriteReview()
}

class ReviewTableViewCell: UITableViewCell, ReviewCompleteProtocol {
    func updateReview() {
        self.reviewTableView.reloadData()
    }
    

    
    //리뷰
    @IBOutlet weak var reviewTableView: UITableView!
    //리뷰 개수 텍스트
    @IBOutlet weak var reviewCountText: UILabel!
    var reviewData : [ReviewEntity]? = nil
    
    var reviewCellDelegate : MoveReviewProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        //
        self.reviewTableView.delegate = self
        self.reviewTableView.dataSource = self
        
        //xib 등록
        var reviewXib = UINib(nibName: "ReviewCellTableViewCell", bundle: nil)
        self.reviewTableView.register(reviewXib, forCellReuseIdentifier:  "ReviewCellTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //구매후기 작성 버튼 리스너
    @IBAction func tapWriteReview(_ sender: UIButton) {
        reviewCellDelegate?.moveWriteReview()
    }
    
    
    
    
}
extension ReviewTableViewCell : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reviewData?.count ?? 0 < 3{
            return reviewData?.count ?? 0
        }
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCellTableViewCell") as? ReviewCellTableViewCell else { return UITableViewCell() }
        
        cell.star = (self.reviewData?[indexPath.row].star) ?? 0
        cell.initStar()
        cell.processing()
        cell.nameText.text = self.reviewData?[indexPath.row].name
        cell.contentText.text = self.reviewData?[indexPath.row].content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
