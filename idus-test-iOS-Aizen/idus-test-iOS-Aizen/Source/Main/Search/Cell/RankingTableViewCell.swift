//
//  RankingTableViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/05.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    var images = ["img_search_first", "img_search_second", "img_search_third", "img_search_fourth"]
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var page: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pageController.numberOfPages = images.count
        pageController.currentPage = 0
        page.image = UIImage(named: images[0])
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        page.image = UIImage(named: images[pageController.currentPage])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
