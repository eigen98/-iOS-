//
//  CategoryViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/22.
//

import UIKit

class CategoryViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigationBar()
    }
    
    // 내비게이션 바 디자인
    func initNavigationBar() {
        
       // let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 28))
        // imageView.contentMode = .scaleAspectFit
        // let image = UIImage(named: "img_logo_idus")
//         let newImageRect = CGRect(x: 0, y: 0, width: 56, height: 28)
//         UIGraphicsBeginImageContext(CGSize(width: 56, height: 28))
        // image?.draw(in: newImageRect)
        // imageView.image = image
         
         //let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        // UIGraphicsEndImageContext()
//         imageView.image = newImage
//         navigationItem.titleView = imageView
         
        
        
        
        
       
        //오른쪽 상단 네비게이션 바 버튼 설정
        let buttonView = UIBarButtonItem()
        let basketImage = UIImage(named: "img_basket")
        buttonView.image = basketImage
        navigationItem.rightBarButtonItem = buttonView
        
        
        //오른쪽 상단 네비게이션 바 버튼 설정
        let leftButtonView = UIBarButtonItem()
        let leftImage = UIImage(named: "category_btn")
        let newImageRect = CGRect(x: 0, y: 0, width: 56, height: 28)
        UIGraphicsBeginImageContext(CGSize(width: 56, height: 28))
        leftImage?.draw(in: newImageRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        
        leftButtonView.image = newImage
        navigationItem.leftBarButtonItem = leftButtonView
        
        
       
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
