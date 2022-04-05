//
//  ParentViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {

    
    @IBOutlet weak var buttonBar: ButtonBarView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initNavigationBar()
        initButtonBar()

        // Do any additional setup after loading the view.
    }
    
    //pager
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
           let new = UIStoryboard.init(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
        new.tabName = "New"


           let realtime = UIStoryboard(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
        realtime.tabName = "실시간"

           let today = UIStoryboard(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
        today.tabName = "투데이"

           return [today, realtime, new]
       }
    
    // 내비게이션 바 디자인
    func initNavigationBar() {
        
        
        
        
        
        
        //가운데 타이틀 설정
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 28))
        
        
       // imageView.contentMode = .scaleAspectFit
         
        let image = UIImage(named: "img_logo_idus")
        let newImageRect = CGRect(x: 0, y: 0, width: 56, height: 28)
        UIGraphicsBeginImageContext(CGSize(width: 56, height: 28))
        image?.draw(in: newImageRect)
       // imageView.image = image
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        imageView.image = newImage
        navigationItem.titleView = imageView
        
        //오른쪽 상단 네비게이션 바 버튼 설정
        let buttonView = UIBarButtonItem()
        let basketImage = UIImage(named: "img_basket")
        buttonView.image = basketImage
        navigationItem.rightBarButtonItem = buttonView
        
        
//        //검색 서치바 설정
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.placeholder = "봄맞이를 검색해보세요."
//        searchController.searchBar.backgroundColor = UIColor.clear
//
//        searchController.searchBar.tintColor = UIColor.clear
//        searchController.searchBar.barTintColor = UIColor.clear
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.automaticallyShowsCancelButton = false
//
//
//
//
//
//        self.navigationItem.searchController = searchController
       
        
       
    }
    
   
    
    // buttonBarView디자인
    func initButtonBar() {
        
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white

           settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 17.0)!
        settings.style.buttonBarItemTitleColor = .gray
//
        
        settings.style.buttonBarItemsShouldFillAvailableWidth  = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        
    settings.style.selectedBarBackgroundColor = UIColor.orange
        buttonBar.selectedBar.backgroundColor = settings.style.selectedBarBackgroundColor
        settings.style.selectedBarHeight = 1.0
        settings.style.buttonBarMinimumLineSpacing = 20
        
            // Changing item text color on swipe
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .gray
                newCell?.label.textColor = .orange
        }
    }
    

    

}
