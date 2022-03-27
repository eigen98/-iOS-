//
//  UIImageView.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/27.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) { DispatchQueue.global().async {
        [weak self] in if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
            
                DispatchQueue.main.async {
                
                    self?.image = image
                
            
                }
            
       
            }
        
    
        }

    }
        

    }
    
}


