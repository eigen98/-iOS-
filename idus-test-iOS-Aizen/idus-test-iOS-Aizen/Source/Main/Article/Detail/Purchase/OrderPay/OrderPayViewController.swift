//
//  OrderPayViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

protocol payCompleteProtocol{

    func completePay()
}
class OrderPayViewController: UIViewController {

    var payDeleagte : payCompleteProtocol? = nil
    
    @IBOutlet weak var payTableView: UITableView!
    //데이터 매니저
    let dataManager = PurchaseDataManager()
    //구매할 작품 정보
    var articleData : ArticleDetailEntity? = nil
    
    @IBOutlet weak var priceText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.payTableView.delegate = self
        self.payTableView.dataSource = self
        
        self.payTableView.backgroundColor = UIColor.systemGray5
        priceText.text = "\(articleData!.price + 3000)원"
        //XIB등록
        let firstNib = UINib(nibName: "FirstCustomerTableViewCell", bundle: nil)
        self.payTableView.register(firstNib, forCellReuseIdentifier: "FirstCustomerTableViewCell")
        
        let secondNib = UINib(nibName: "SecondAddressTableViewCell", bundle: nil)
        self.payTableView.register(secondNib, forCellReuseIdentifier: "SecondAddressTableViewCell")
        
        let thirdNib = UINib(nibName: "ThirdArticleInfoTableViewCell", bundle: nil)
        self.payTableView.register(thirdNib, forCellReuseIdentifier: "ThirdArticleInfoTableViewCell")
        
        let forthNib = UINib(nibName: "FourthPayTypeTableViewCell", bundle: nil)
        self.payTableView.register(forthNib, forCellReuseIdentifier: "FourthPayTypeTableViewCell")
        
        let fifthNib = UINib(nibName: "FifthPayInfoTableViewCell", bundle: nil)
        self.payTableView.register(fifthNib, forCellReuseIdentifier: "FifthPayInfoTableViewCell")
        
        let sixthNib = UINib(nibName: "SixthAgreeTableViewCell", bundle: nil)
        self.payTableView.register(sixthNib, forCellReuseIdentifier: "SixthAgreeTableViewCell")
    }
    

   
    @IBAction func tapBackBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    

    //결제하기 버튼
    @IBAction func tapPayBtn(_ sender: UIButton) {
        
        self.dataManager.purchaseGet(delegate: self, articleId: self.articleData!.workId)
        payDeleagte?.completePay()
        
        dismiss(animated: false, completion: nil)
        
        
    }
}

extension OrderPayViewController : UITableViewDelegate, UITableViewDataSource {
    
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    //셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return " "
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomerTableViewCell") as? FirstCustomerTableViewCell else {
                
                return UITableViewCell()
            }
            return cell
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SecondAddressTableViewCell") as? SecondAddressTableViewCell {
               
                return cell
            }
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdArticleInfoTableViewCell") as? ThirdArticleInfoTableViewCell else{
                
                return UITableViewCell()
            }
            
            cell.titleText.setTitle(self.articleData!.title, for: .normal)
            cell.articlePriceText.text = "\(self.articleData!.price)원"
            cell.underTitleText.text = self.articleData!.title
            return cell
            
        case 3:
            guard let  cell = tableView.dequeueReusableCell(withIdentifier: "FourthPayTypeTableViewCell") as? FourthPayTypeTableViewCell  else {
               
                return  UITableViewCell()
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FifthPayInfoTableViewCell") as? FifthPayInfoTableViewCell else{
                
                return UITableViewCell()
            }
            
            cell.articlePriceText.text = "\(articleData!.price)"
            cell.totalPrice.text = "\(articleData!.price + 3000)"
            return cell
            
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SixthAgreeTableViewCell") as? SixthAgreeTableViewCell {
                
                return cell
            }
            
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    
    }
    
    //헤더 크기 줄이기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.3
    }
}
