//
//  SearchPresentViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/04/05.
//

import UIKit

class SearchPresentViewController: UIViewController {

    
    
    
    @IBOutlet weak var searchTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchTableVIew.delegate = self
        searchTableVIew.dataSource = self
        
        //XIB 등록
        let rankingXib = UINib(nibName: "RankingTableViewCell", bundle: nil)
        self.searchTableVIew.register(rankingXib, forCellReuseIdentifier: "RankingTableViewCell")
        let popularXib = UINib(nibName: "PopularTableViewCell", bundle: nil)
        self.searchTableVIew.register(rankingXib, forCellReuseIdentifier: "RankingTableViewCell")
        self.searchTableVIew.register(popularXib, forCellReuseIdentifier: "PopularTableViewCell")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: false) {
            let mainController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabbarController")
            self.changeRootViewController(mainController)
        }
    }
    

}

extension SearchPresentViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0 :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell") as? RankingTableViewCell {
                
                
                return cell
        }
        case 1 :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell") as? PopularTableViewCell {
                
                
                return cell
        
    
            }
    
    
        default:
            return UITableViewCell()
        
        }
    
    return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 406
        }else{
            return 492
        }
    }
}
