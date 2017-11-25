//
//  LoginKeyTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class LoginKeyTranslator {

    func translate(data: Data) -> LoginKey? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        
        let dict = dataJson as? [String: Any]
        let key = dict?["key"] as? String
        return key.map(LoginKey.init)
    }
}
