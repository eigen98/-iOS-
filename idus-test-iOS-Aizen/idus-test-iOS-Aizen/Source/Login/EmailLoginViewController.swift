//
//  EmailLoginViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/20.
//

import UIKit
//이메일 로그인 화면
class EmailLoginViewController: BaseViewController {

    //이메일 텍스트
    @IBOutlet weak var emailText: UITextField!
    //비밀번호 텍스트
    @IBOutlet weak var passwordText: UITextField!
    //로그인 버튼
    @IBOutlet weak var tabLogin: UIButton!
    
    //데이터 매니저
    let dataManager = LoginDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //뒤로 가기 버튼 
    @IBAction func tabBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    //로그인 버튼 리스너
    @IBAction func tapLogin(_ sender: UIButton) {
        if emailText.text == "" {
            self.presentAlert(title: "이메일을 입력해주세요")
            return
        }else if passwordText.text == ""{
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        //로그인 요청
        var parameter = EmailLoginRequest(email: emailText.text!, password: passwordText.text!)
        dataManager.loginPost(parameter, delegate: self)
        
    }
    func didSuccessLogin(){
        //로그인 성공시 메인 화면으로 넘어가기
        
        let mainController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabbarController")
        changeRootViewController(mainController)
        print("로그인 성공")
    }
    func failedLogin(message : String){
        self.presentAlert(title: message)
    }
    
    
    

}
