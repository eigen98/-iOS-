//
//  DirectBuyViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/28.
//

import UIKit

class DirectBuyViewController: UIViewController {

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
        orderPayBuyVC.modalPresentationStyle = .fullScreen
        present(orderPayBuyVC, animated: true, completion: nil)
        
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
