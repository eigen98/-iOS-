//
//  NewViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit
import XLPagerTabStrip

class NewViewController: UIViewController , IndicatorInfoProvider {
    var tabName: String = ""
    //@IBOutlet weak var tabNameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        tabNameLbl.text = tabName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
}
