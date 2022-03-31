//
//  DirectBuyViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

class DirectBuyViewController: UIViewController, payCompleteProtocol {
    
    
    func completePay() {
        self.didBuySuccess = true
        
    }
    var didBuySuccess = false
    
    //상세화면에서 받아올 작품 정보
    var articleData : ArticleDetailEntity? = nil

    @IBOutlet weak var contentText: UITextView!
    
    @IBOutlet weak var placeholderContent: UILabel!
    
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var priceText: UILabel!
    
    @IBOutlet weak var articlePriceText: UILabel!
    
    @IBOutlet weak var numberingText: UILabel!
    
    @IBOutlet weak var resultArticleText: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        print("\(didBuySuccess)")
        if self.didBuySuccess == true {
            self.dismiss(animated: true, completion: {
                self.presentAlert(title: "결제되었습니다.")})
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentText.layer.isHidden = true
        // Do any additional setup after loading the view.
        
        contentText.text = articleData!.content
        titleText.text = articleData!.title
        priceText.text = "\(articleData!.price)원"
        articlePriceText.text = "\(articleData!.price)원"
        resultArticleText.text = "\(articleData!.price)원"
        var url = URL(string: articleData!.imgs[0] )!
        imageView.load(url: url )
        
        
        
    }
    
    @IBAction func tapOrderArticleBtn(_ sender: UIButton) {
        //let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let orderPayBuyVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderPayViewController") as? OrderPayViewController else { return }
        orderPayBuyVC.articleData = self.articleData //넘겨받은 작품 정보를 다음 결제 화면에 넘겨줌
        orderPayBuyVC.modalPresentationStyle = .fullScreen
        orderPayBuyVC.payDeleagte = self
        present(orderPayBuyVC, animated: true, completion: nil)
        
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
