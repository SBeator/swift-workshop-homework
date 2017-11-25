//
//  MainScreenViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

class MainScreenViewModel {
    var loginKey: LoginKey?
    var shouldPerformLogin: Bool {
        return loginKey == nil
    }
}
