//
//  RealTimeViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/06.
//

import UIKit
import XLPagerTabStrip
class RealTimeViewController: UIViewController ,IndicatorInfoProvider{
    var tabName : String = "실시간"
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
