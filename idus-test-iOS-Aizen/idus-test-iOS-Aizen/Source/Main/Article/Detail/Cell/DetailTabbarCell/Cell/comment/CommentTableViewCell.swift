//
//  CommentTableViewCell.swift
//  idus-test-iOS-Aizen
//

//

import UIKit
// 테이블 뷰 안에 또다른 셀인 댓글 테이블 뷰 안으로 데이터를 전송하기 위한 딜리게이트
protocol CommentInTableProtocol{
    func transferCommentData(commentData : [CommentResponse], workId : Int)

    
}

class CommentTableViewCell: UITableViewCell, CommentInTableProtocol{
   
    var commentDeleteDelegate : CommentDeleteProtocol? = nil
    
    var delegateViewController : UIViewController? = nil
    @IBOutlet weak var firstMessageText: UILabel!
    @IBOutlet weak var firstMessageImg1: UIImageView!
    //댓글쓰기 데이터매니저
    let commentDataManager : CommentDataManager = CommentDataManager()
    var isCommentUploaded : Bool = false
    
    //댓글 데이터 전달 프로토콜 (처음 받을 때 거꾸로 sort함 다음 추가되는 데이터는 맨 처음에 추가해야함.)
    func transferCommentData(commentData: [CommentResponse], workId : Int) {
        self.commentData = commentData.reversed() //거꾸로
        self.workId = workId
        self.commentListTableView.reloadData()
    }
    //댓글 입력 창
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBOutlet weak var commentListTableView: UITableView!
    
    var delegate : CommentInTableProtocol? = nil
    
    @IBOutlet weak var transferBtn: UIButton! // 전송버튼
    
    
    //상세화면에서 불러올 api 요청 반환 댓글정보  엔티티
    /*
    struct CommentResponse : Codable{
        var workCommentId : Int
        var name : String
        var comment : String
    }
     */

   
    //받아올 댓글 데이터
    var commentData : [CommentResponse] = [CommentResponse]()
    var workId : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.commentListTableView.delegate = self
        self.commentListTableView.dataSource = self
        
        //xib 등록
        
        let commentCellXib = UINib(nibName: "CommentListTableViewCell", bundle: nil)
        self.commentListTableView.register(commentCellXib, forCellReuseIdentifier: "CommentListTableViewCell")
        
        //가로크기를 0
        //self.transferBtn.widthAnchor.constraint(equalToConstant: 0).isActive = true
        //댓글 버튼 애니메이션 효과
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.8, animations: ({
                
                self.transferBtn.transform = CGAffineTransform(translationX: 80, y: 0)
                
//                self.commentTextField.transform = CGAffineTransform(scaleX: 1.3, y: 1.0 )
            }))
        }
        self.commentTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    var isAnimated  = false
    @objc func textFieldDidChange(_ sender: Any?) {
        if isAnimated == true {
            return
        }
        isAnimated = true
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 1.5, animations: ({
                
                self.transferBtn.transform = CGAffineTransform(translationX: -10, y: 0)
            }))
        }
    }
    
        
   //전송 버튼 리스너
    @IBAction func uploadCommentBtn(_ sender: UIButton) {
        isCommentUploaded = true
        
        //로컬에 저장된 jwt토큰
        var jwt = KeyChainManager.shared.readUser()?.jwtToken
        //로그인 상태가 아니라면
        if jwt != nil {
       
            
        }else {
            //로그인화면으로  전환
            let loginController = UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateViewController(identifier: "LoginMainViewController")
            delegateViewController?.changeRootViewController(loginController)
            return
        }
        let content = self.commentTextField.text
        let workId = self.workId
        self.commentDataManager.commentPost(CommentRequest(workId: workId, content: content!), delegate: self)
            
        
        
        self.commentTextField.text = ""
        self.commentListTableView.reloadData()
        
    }
    
       
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


    

extension CommentTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commentData.count > 3 {
            if isCommentUploaded == true{
                //return 4
            }
            //댓글 개수 3개까지만 미리보기
            return 3
        }
        return commentData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentListTableViewCell", for: indexPath) as? CommentListTableViewCell else{ return UITableViewCell()}
        cell.commentData = commentData[indexPath.row]
        cell.userNameText.text = commentData[ indexPath.row].name
        cell.userCommentText.text = commentData[ indexPath.row].comment
        cell.commentDeleteDelegate = self.commentDeleteDelegate
        cell.cell = self
        
        print("댓글 이름은 \(cell.commentData?.name)")
        print("내  이름은 \(UserDefaults.standard.string(forKey: "name"))")
        if cell.commentData?.name != UserDefaults.standard.string(forKey: "name"){
            cell.deleteCommentBtn.isHidden = true
            
            print(cell.commentData?.name == UserDefaults.standard.string(forKey: "name"))
        }else{
            cell.deleteCommentBtn.isHidden = false
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 100
        
     }

    
}
