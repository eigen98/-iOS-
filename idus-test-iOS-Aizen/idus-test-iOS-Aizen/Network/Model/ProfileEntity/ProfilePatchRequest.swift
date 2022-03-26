//
//  ProfilePatchRequest.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

//프로필 수정에 필요한 엔티티
struct ProfilePatchRequest : Codable {
    let email : String?
    let name : String?
    let birthday : Date?
    let gender : Int?
    let phone : String?
    let recipient : String?
    let recipientPhone : String?
    let address : String?
    let profileImg : String?
}
