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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "img_logo_idus")
        imageView.image = image
        navigationItem.titleView = imageView
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
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white

//            settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 17.0)!
            settings.style.buttonBarItemTitleColor = .gray
            
            settings.style.buttonBarMinimumLineSpacing = 20
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0
            settings.style.selectedBarHeight = 3.0
            settings.style.selectedBarBackgroundColor = .orange
        
            // Changing item text color on swipe
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .gray
                newCell?.label.textColor = .orange
                
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
