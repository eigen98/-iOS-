//
//  SearchViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var searchTabbar: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SearchPresentViewController") as? SearchPresentViewController else { return
            print("서치뷰 생성 실패")
        }
        
        //self.navigationController?.pushViewController(directBuyVC, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

        // Do any additional setup after loading the view.
        self.searchTabbar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: .selected)
        
        
    }
    
    @IBAction func backToPrevious(_ sender: UIButton) {
        print("이동")
        
        
    }
    
    private func initSearchBar() {
        // 검색 버튼
       
       
        // 검색 버튼
            let search = UIBarButtonItem(systemItem: .search, primaryAction: UIAction(handler: { _ in
                // search action
            }))
            self.navigationItem.rightBarButtonItem = search
            let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width - 80, height: 0))
            searchBar.placeholder = "맥주를 검색해보세요"
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
       
       
       
       
       
        
        
        //뒤로가기 버튼
//        let backBtn = UIBarButtonItem(systemItem: , primaryAction: UIAction(handler: { _ in
//            // back action
//        }))
        self.navigationItem.leftBarButtonItem = search
    }
    
    func initNavigationBar() {

    
        
        //오른쪽 상단 네비게이션 바 버튼 설정
        let buttonView = UIBarButtonItem()
        let basketImage = UIImage(named: "img_basket")
        buttonView.image = basketImage
        navigationItem.rightBarButtonItem = buttonView
        
        
        //검색 서치바 설정
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "봄맞이를 검색해보세요."
        searchController.searchBar.backgroundColor = UIColor.white

        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = false
        self.navigationItem.searchController = searchController
        
        
       
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
