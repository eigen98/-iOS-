//
//  MyInfoViewController.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/21.
//

import UIKit

struct typeOfCell{
    
    var type : String
    
    static func generateData() -> [typeOfCell]{
        return
        [
            typeOfCell(type: "MyInfoProfileTableViewCell"),
            typeOfCell(type: "MyInfoPlusTableViewCell"),
            typeOfCell(type: "addBannerTableViewCell"),
            typeOfCell(type: "RecentTableViewCell"),
            typeOfCell(type: "NoticeTableViewCell"),
            typeOfCell(type: "CorInfoTableViewCell"),
            //Todo 로그인 여부 체크
            typeOfCell(type: "MyInfoNoLoginTableViewCell")
        
        ]
        
    }
}

class MyInfoViewController: BaseViewController {

    var cellList = typeOfCell.generateData()
    //테이블 뷰
    @IBOutlet weak var myInfotableView: UITableView!
    
    // list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myInfotableView.backgroundColor = .systemGray6
        
        
    
        

        myInfotableView.delegate = self
        myInfotableView.dataSource = self
        
        //xib 셀 등록
        let profileXib = UINib(nibName: "MyInfoProfileTableViewCell", bundle: nil)
        self.myInfotableView.register(profileXib, forCellReuseIdentifier: "MyInfoProfileTableViewCell")
        let plusXib = UINib(nibName: "MyInfoPlusTableViewCell", bundle: nil)
        self.myInfotableView.register(plusXib, forCellReuseIdentifier: "MyInfoPlusTableViewCell")
        let bannerXib = UINib(nibName: "addBannerTableViewCell", bundle: nil)
        self.myInfotableView.register(bannerXib, forCellReuseIdentifier: "addBannerTableViewCell")
        let recentXib = UINib(nibName: "RecentTableViewCell", bundle: nil)
        self.myInfotableView.register(recentXib, forCellReuseIdentifier: "RecentTableViewCell")
        let noticeXib = UINib(nibName: "NoticeTableViewCell", bundle: nil)
        self.myInfotableView.register(noticeXib, forCellReuseIdentifier: "NoticeTableViewCell")
        let corInfoXib = UINib(nibName: "CorInfoTableViewCell", bundle: nil)
        self.myInfotableView.register(corInfoXib, forCellReuseIdentifier: "CorInfoTableViewCell")
        let noLoginXib = UINib(nibName: "MyInfoNoLoginTableViewCell", bundle: nil)
        self.myInfotableView.register(noLoginXib, forCellReuseIdentifier: "MyInfoNoLoginTableViewCell")
        
        //바 버튼 아이템 설정
        let btnMessage = UIBarButtonItem(image: UIImage(named: "img_message")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapMessageBtn))
        let btnAlarm = UIBarButtonItem(image: UIImage(named: "img_alarm")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapAlarmBtn))
        let btnBasket = UIBarButtonItem(image: UIImage(named: "img_basket")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapbasketBtn))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.rightBarButtonItems = [btnMessage, btnAlarm, btnBasket]

        

    }
    
    @objc func tapInfo(){
        
    }
    @objc func tapMessageBtn() {
        
    }
    @objc func tapAlarmBtn() {
        
    }
    @objc func tapbasketBtn() {
    }
    
    @objc func moveInfo() {
    }
        
    
    

    

}

extension MyInfoViewController :UITableViewDelegate, UITableViewDataSource {
    
    
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    //각 섹션의 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //셀 높이 설정
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
        return 360
    case 1:
        return 240
    case 2:
        return 64
    case 3:
        return 240
    case 4:
        return 180
    case 5:
        return 235
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = cellList[indexPath.section].type // 셀에 표시할 데이터를 가져옴
        //let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
                
        switch target {
            //프로필 섹션
            //enum case로 변경!!!
        case "MyInfoProfileTableViewCell":
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoProfileTableViewCell") as? MyInfoProfileTableViewCell {
                
                
                return cell
            }
                
             //구현 안하는 탭 섹션
        case "MyInfoPlusTableViewCell" :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoPlusTableViewCell") as? MyInfoPlusTableViewCell {
                
                return cell
            }
            //광고 배너 섹션
        case "addBannerTableViewCell" :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "addBannerTableViewCell") as? addBannerTableViewCell {
                
                return cell
            }
        case "RecentTableViewCell" :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell") as? RecentTableViewCell {
                
                return cell
            }
        case "NoticeTableViewCell" :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell") as? NoticeTableViewCell {
                
                return cell
            }
        case "CorInfoTableViewCell" :
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CorInfoTableViewCell") as? CorInfoTableViewCell {
                
                return cell
            }
        
        
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.3
    }
    
    
}

