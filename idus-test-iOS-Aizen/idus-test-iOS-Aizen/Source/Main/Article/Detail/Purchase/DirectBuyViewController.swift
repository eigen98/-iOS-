//
//  DirectBuyViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

class DirectBuyViewController: UIViewController {
    
    //상세화면에서 받아올 작품 정보
    var articleData : ArticleDetailEntity? = nil

    @IBOutlet weak var contentText: UITextView!
    
    @IBOutlet weak var placeholderContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentText.layer.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOrderArticleBtn(_ sender: UIButton) {
        //let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let orderPayBuyVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderPayViewController") as? OrderPayViewController else { return }
        orderPayBuyVC.articleData = self.articleData //넘겨받은 작품 정보를 다음 결제 화면에 넘겨줌
        orderPayBuyVC.modalPresentationStyle = .fullScreen
        present(orderPayBuyVC, animated: true, completion: nil)
        
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
