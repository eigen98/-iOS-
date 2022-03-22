//
//  ClassViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip

class ClassViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
           let diary = UIStoryboard.init(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
           diary.tabName = "New"


           let calendar = UIStoryboard(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
           calendar.tabName = "New"

           let plan = UIStoryboard(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewVC") as! NewViewController
           plan.tabName = "New"

           return [calendar, plan, diary]
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
