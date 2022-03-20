//
//  LoginMainViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/20.
//

import UIKit

class LoginMainViewController: BaseViewController {

    @IBOutlet weak var anotherLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //다른 방법으로 가입하기 버튼
    @IBAction func tapAnotherLoginBtn(_ sender: UIButton) {
        //하단 액션 시트 뷰
        presentActionSheet()
    }
    
    //가입 방법형태 선택 다이얼로그
    func presentActionSheet(){
        let actionNaver = UIAlertAction(title: "네이버", style: .default){ action in
            self.presentBottomAlert(message: "")
            
        }
        let actionFaceBook = UIAlertAction(title: "페이스북", style: .default){ action in
            self.presentBottomAlert(message: "")
            
        }
        let actionTwitter = UIAlertAction(title: "트위터", style: .default){ action in
            self.presentBottomAlert(message: "")
            
        }
        let actionEmail = UIAlertAction(title: "이메일", style: .default){ action in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmailSignUpViewController") as? EmailSignUpViewController else {return}
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel){ action in
            //
            
        }
        self.presentAlert(title: "다른 방법으로 가입하기" ,
                          preferredStyle: .actionSheet,
                          with: actionEmail,actionFaceBook, actionNaver, actionTwitter, actionCancel)
    }
    //기존 회원 로그인 버튼클릭 메소드
    @IBAction func tapLoginExisting(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailLoginViewController else {
            return
        }
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated : true)
    }
    
    

}
