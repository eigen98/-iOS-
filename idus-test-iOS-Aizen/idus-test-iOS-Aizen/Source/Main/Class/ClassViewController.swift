//
//  ClassViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip
//온라인과 오프라인 상단 탭 구현

class ClassViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var buttonBar: ButtonBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initNavigationBar()
        initButtonBar() 
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
           let online = UIStoryboard(name: "ClassStoryboard", bundle: nil).instantiateViewController(identifier: "OnlineVC")
       


           let offline = UIStoryboard(name: "ClassStoryboard", bundle: nil).instantiateViewController(identifier: "OfflineVC")
        

        

           return [online, offline]
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
        
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "봄맞이를 검색해보세요."
        searchController.searchBar.backgroundColor = UIColor.white
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white

        
        self.navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = false
    }
    
    // buttonBarView디자인
    func initButtonBar() {
        settings.style.selectedBarBackgroundColor = UIColor.orange
        buttonBar.selectedBar.backgroundColor = settings.style.selectedBarBackgroundColor
    
        
        self.settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white

        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 17.0)!
        settings.style.buttonBarItemTitleColor = .gray
            
        settings.style.buttonBarMinimumLineSpacing = 20
        
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        
    
        //??
        
        
        
            // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .orange
                
        }
    }

    

}
