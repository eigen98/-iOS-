//
//  ParentViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {

    
    @IBOutlet weak var articleTabbar: UITabBarItem!
    
    @IBOutlet weak var buttonBar: ButtonBarView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initNavigationBar()
        initButtonBar()
        self.articleTabbar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: .selected)
        
        

        // Do any additional setup after loading the view.
    }
    


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var hasOpened : Int = UserDefaults.standard.integer(forKey: "hasOpened")
        //처음 여는 상태라면
        print( "메인화면 hasOpened = \(UserDefaults.standard.integer(forKey: "hasOpened") )" )
        if hasOpened == 0 {
       
            
            self.tabBarController?.selectedIndex = 4
            UserDefaults.standard.set(1, forKey: "hasOpened")
            print( "hasOpened 변경 = \(UserDefaults.standard.integer(forKey: "hasOpened") )" )
            
        }else {
           //처음이 아니라면
            self.tabBarController?.selectedIndex = 0
            
        }
        
    }
    
    @IBAction func moveSearch(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "SearchStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SearchPresentViewController") as? SearchPresentViewController else { return
            print("DirectBuy 생성 실패")
        }
         //작품 정보를 다음 바로결제 화면으로 넘겨줌
        
        //self.navigationController?.pushViewController(directBuyVC, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        
    }
    
    //pager
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
           let new = UIStoryboard.init(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
        new.tabName = "New"


           let realtime = UIStoryboard(name: "RealTimeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RealVC") as! RealTimeViewController
        //realtime.tabName = "실시간"

           let today = UIStoryboard(name: "TodayStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TodayVC") as! TodayViewController
        //today.tabName = "투데이"

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
