//
//  EmailSignUpViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/20.
//

import UIKit

class EmailSignUpViewController: UIViewController {

    // 동의필요 항목 뷰 컨테이너
    @IBOutlet weak var agreeContainerView: UIStackView!
    
    //체크 박스 버튼 뷰
    @IBOutlet weak var allCheckbox: UIButton!
    
    @IBOutlet weak var oldCheckbox: UIButton!
    
    @IBOutlet weak var guidCheckbox: UIButton!
    
    @IBOutlet weak var infoCheckbox: UIButton!
    
    @IBOutlet weak var couponCheckbox: UIButton!
    //이메일 텍스트
    @IBOutlet weak var emailText: UITextField!
    //이름
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var passwordAgain: UITextField!
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    @IBOutlet weak var recommandCode: UITextField!
    
    //체크박스 체크여부
    var ischecked = [false, false, false, false]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        initViewLine()
        // Do any additional setup after loading the view.
    }
    
    //체크 박스 클릭 메소드
    @IBAction func checkAll(_ sender: UIButton) {
        
        
        for i in 0...3 {
            ischecked[i] = true
        }
        self.allCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        self.oldCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        self.guidCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        self.infoCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        self.couponCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
    }
    @IBAction func checkfirst(_ sender: UIButton) {
        if self.ischecked[0] == false {
            self.ischecked[0] = true
            self.oldCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else{
            self.ischecked[0] = false
            self.oldCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
            //모두 체크 해제
            self.allCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @IBAction func checkSecond(_ sender: UIButton) {
        if self.ischecked[1] == false {
            self.ischecked[1] = true
            self.guidCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else{
            self.ischecked[1] = false
            
            self.guidCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
            //모두 체크 해제
            self.allCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @IBAction func checkThird(_ sender: UIButton) {
        if self.ischecked[2] == false {
            self.ischecked[2] = true
            self.infoCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else{
            self.ischecked[2] = false
            self.infoCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
            //모두 체크 해제
            self.allCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @IBAction func checkForth(_ sender: UIButton) {
        if self.ischecked[3] == false {
            self.ischecked[3] = true
            self.couponCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }else{
            self.ischecked[3] = false
            self.couponCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
            //모두 체크 해제
            self.allCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    
    //동의하고 회원가입 버튼 클릭
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        //이메일 유효한가?
        if !isValidEmail(email: emailText.text ?? ""){
            self.presentAlert(title: "이메일 형식을 확인해주세요.")
            return
        }
        
        //이름을 입력해주세요
        if nameText.text == "" {
            self.presentAlert(title: "이름을 입력해주세요.")
            return
        }
        
        //비밀번호를 입력해주세요
        if !isValidPW(password: passwordText.text ?? ""){
            self.presentAlert(title: "영문, 숫자, 특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.")
            return
        }
        //비밀번호가 일치하지 않습니다.
        if passwordText.text != passwordAgain.text {
            self.presentAlert(title: "비밀번호가 일치하지 않습니다.")
            return
        }
        
        if !isValidPhone(number: phoneNumberText.text ?? "") {
            self.presentAlert(title: "전화번호를 입력해주세요.")
            return
        }
        
        //이용약관에 동의해주세요
        if self.ischecked[0] == false || self.ischecked[1] == false || self.ischecked[2] == false {
            self.presentAlert(title: "이용약관에 동의해주세요.")
            return
        }
        
        //MARK : 회원가입 요청
        // signupForEmail()
        
    }
    
    //이메일 유효성 검사
    func isValidEmail( email : String) -> Bool {
        let emailRule = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRule)
        return emailTest.evaluate(with: email)
    }
    //비밀번호 유효성 검사
    func isValidPW(password : String) -> Bool {
        let passwordRule = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,25}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRule)
        return passwordTest.evaluate(with: password)
    }
    
    func isValidPhone(number : String) -> Bool {
        let phoneRule = "^01[0-1, 7][0-9]{7,8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRule)
        return phoneTest.evaluate(with: number)
    }
    
    //뷰 속성 테두리 설정
    func initViewLine(){
        //테두리 굵기
        self.agreeContainerView.layer.borderWidth = 1
        //테두리 컬러
        self.agreeContainerView.layer.borderColor = UIColor.white.cgColor
        //테두리 둥글게
        self.agreeContainerView.layer.cornerRadius = 5
        
    }
    
    


}
