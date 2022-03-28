//
//  SettingViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import UIKit
//내 정보 -> 설정(톱니) 버튼
class SettingViewController: BaseViewController ,MyProfileProtocol{
    //프로토콜 메소드
    func moveMyAccountSetting() {
        let myInfoStoryboard = UIStoryboard(name: "MyInfoStoryboard", bundle: nil)
        guard let myAccountVC = myInfoStoryboard.instantiateViewController(withIdentifier: "MyProfileSetViewController") as? MyProfileSetViewController else { return }
        myAccountVC.userData = self.userData
        self.navigationController?.pushViewController(myAccountVC, animated: true)
    }
    

    //전 화면에서 받을 프로필 정보
    var userData : ProfileResponse? = nil
    
    //테이블 뷰
    @IBOutlet weak var SettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SettingTableView.delegate = self
        SettingTableView.dataSource = self
        
        SettingTableView.backgroundColor = .systemGray6
        
        
        //XIB등록
        let profileXib = UINib(nibName: "SettingProfileTableViewCell", bundle: nil)
        self.SettingTableView.register(profileXib, forCellReuseIdentifier: "SettingProfileTableViewCell")
        let myAccountTabXib = UINib(nibName: "MyAccountTabTableViewCell", bundle: nil)
        self.SettingTableView.register(myAccountTabXib, forCellReuseIdentifier: "MyAccountTabTableViewCell")
    
        let creditXib = UINib(nibName: "CreditCardTableViewCell", bundle: nil)
        self.SettingTableView.register(creditXib, forCellReuseIdentifier: "CreditCardTableViewCell")
        let refundXib = UINib(nibName: "RefundManageTableViewCell", bundle: nil)
        self.SettingTableView.register(refundXib, forCellReuseIdentifier: "RefundManageTableViewCell")
        let alarmXib = UINib(nibName: "AlarmTableViewCell", bundle: nil)
        self.SettingTableView.register(alarmXib, forCellReuseIdentifier: "AlarmTableViewCell")
        let logoutXib = UINib(nibName: "LogOutTableViewCell", bundle: nil)
        self.SettingTableView.register(logoutXib, forCellReuseIdentifier: "LogOutTableViewCell")
        
        
        
        
    }
    

    
}
extension SettingViewController : UITableViewDelegate, UITableViewDataSource{
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    //cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //셀 높이 설정
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
        return 232
    case 1:
        return 213
    case 2:
        return 141
    case 3:
        return 70
    case 4:
        return 210
    case 5:
        return 71
    default:
        return 0
    
    }
   
   }
    
   
       
       
       
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //첫번째 섹션의 헤더 공간 없애기
        if section == 0 {
            return nil
           }
        return " "
    }
    
    //셀 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingProfileTableViewCell") as? SettingProfileTableViewCell {
               
                cell.nameText.text = userData?.result?.name
                cell.emailText.text = userData?.result?.email
                
                return cell
                
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountTabTableViewCell") as? MyAccountTabTableViewCell {
                //딜리게이트 위임
                cell.delegate = self
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardTableViewCell") as? CreditCardTableViewCell {
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RefundManageTableViewCell") as? RefundManageTableViewCell {
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell") as? AlarmTableViewCell {
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell") as? LogOutTableViewCell {
                cell.delegate = self //딜리게이트 설정
                return cell
            }
            
        default:
            UITableViewCell()
        }
        return UITableViewCell()
    }
    
    //헤더 크기 줄이기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.3
    }
    
    
    
}
extension SettingViewController : LogoutProtocol {
    
    
    func logOutNow() {
        
        
        //데이터 삭제
        
        KeyChainManager.shared.deleteUser()
        
        //로그인화면으로  전환
        let loginController = UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateViewController(identifier: "LoginMainViewController")
        changeRootViewController(loginController)
        
        //self.dismiss(animated: false, completion: nil)
    }
    
    
}
