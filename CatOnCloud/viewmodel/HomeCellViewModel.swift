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
    
    var id: String {
        get {
            return model.id
        }
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
    
    var avatar: CatImage {
        get {
            return model.avatar
        }
    }
    
    var thumbs: [CatImage] {
        get {
            return model.thumbs
        }
    }
    
    var time: String {
        get {
            return getTime(timestamp: model.timestamp)
        }
    }
    
    func getTime(timestamp: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-d'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: timestamp)
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        return dateFormatter.string(from: date!)
    }
}
