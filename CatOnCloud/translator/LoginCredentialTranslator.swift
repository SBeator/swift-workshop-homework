//
//  LoginCredentialTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class LoginCredentialTranslator {

    func translate(credential: LoginCredential) -> Data {
        let dict = [
            "username": credential.username,
            "password": credential.password
        ]
        
        return try! JSONSerialization.data(withJSONObject: dict, options: [])
    }

}
