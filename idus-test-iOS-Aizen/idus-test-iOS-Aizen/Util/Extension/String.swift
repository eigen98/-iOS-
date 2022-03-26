//
//  String.swift
//  idus-test-iOS-Aizen
//
//  Created by JeongMin Ko on 2022/03/26.
//

import Foundation

//서버에 토큰 보낼 때 변환하는 작업
extension String {

    func fromBase64() -> String? {

        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {

            return nil

        }

        

        return String(data: data as Data, encoding: String.Encoding.utf8)

    }

    

    func toBase64() -> String? {

        guard let data = self.data(using: String.Encoding.utf8) else {

            return nil

        }

        

        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))

    }

}
