//
//  HomeCellViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

class HomeCellViewModel {
    var model: HomeCellModel
    
    init(model: HomeCellModel) {
        self.model = model
    }
    
    var cat: String {
        get {
            return model.cat
        }
    }
    
    var message: String {
        get {
            return model.message
        }
    }
    
    var time: String {
        get {
            return getTime(timestamp: model.timestamp)
        }
    }
    
    func getTime(timestamp: String) -> String {
        return "5 mins ago"
    }
}
