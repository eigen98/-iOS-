//
//  NewCollectionViewCell.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/23.
//

import UIKit
//찜버튼 눌렀을 때 필요한 프로토콜
protocol NewProtocol{
    func zzimListner(id : Int?)
    func checkOnlyImg()
}

class NewCollectionViewCell: UICollectionViewCell {

    var delegate : NewProtocol?
    
    var workId : Int? = nil// 찜 아이템 식별을 위한 작품 아이디
    //찜 버튼
    @IBOutlet weak var zzimBtn: UIButton!
    
    @IBOutlet weak var uiImageView: UIImageView!
    
    @IBOutlet weak var belong: UILabel!
    
    @IBOutlet weak var articleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tapZzimBtn(_ sender: UIButton) {
        delegate?.zzimListner(id: self.workId)
        print("찜")
    }
    

}
