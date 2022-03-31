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

    @IBOutlet weak var totalPriceText: UILabel!
    
    //상세화면에서 받아올 작품 정보
    var articleData : ArticleDetailEntity? = nil
    
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
        
        totalPriceText.text = "\(2500 + self.articleData!.price ?? 0)원"
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBottomSheetTableViewCell") as? DetailBottomSheetTableViewCell else { return UITableViewCell() }
        
        
        cell.priceText.text = "\(self.articleData!.price)원"
        
        return cell
            
            
        
    }
    
    
}
