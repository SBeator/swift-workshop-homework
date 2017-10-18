//
//  LoginViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 18/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

class LoginViewModel {
    public func login(username: String, password: String) -> Bool {
        return username == "admin" && password == "admin"
    }
}
