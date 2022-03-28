//
//  DetailBottomSheetViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

protocol StartBuyProtocol {
    func isClickedBtnBuy()
}

class DetailBottomSheetViewController: UIViewController {

    var buyDelegate : StartBuyProtocol?
    @IBOutlet weak var bottomSheetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomSheetTableView.delegate = self
        bottomSheetTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        //XIB 등록
        let articleListNib = UINib(nibName: "DetailBottomSheetTableViewCell", bundle: nil)
        self.bottomSheetTableView.register(articleListNib, forCellReuseIdentifier: "DetailBottomSheetTableViewCell")
        
    }
    
    @IBAction func tapCloseSheet(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapBuyBtn(_ sender: UIButton) {
        buyDelegate?.isClickedBtnBuy()// 구매하기 버튼 눌렀음 -> 부울값 true
        self.dismiss(animated: true, completion: {
            //TODO 구입 상세 화면 이동
            
        })
    }
    

}

extension DetailBottomSheetViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBottomSheetTableViewCell") as? DetailBottomSheetTableViewCell{ return cell }
            
            
        return UITableViewCell()
    }
    
    
}
