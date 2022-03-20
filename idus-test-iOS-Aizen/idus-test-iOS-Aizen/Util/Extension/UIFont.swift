//
//  UIFont.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/20.
//

import Foundation

import Foundation
import UIKit

extension UIFont {
    public enum NotoSansType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }

    static func NotoSans(_ type: NotoSansType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-\(type.rawValue)", size: size)!
    }
}
