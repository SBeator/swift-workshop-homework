//
//  CatViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class CatViewModel {
    var catDetailsModel: CatDetails
    
    init(model: CatDetails) {
        self.catDetailsModel = model
    }
    
    var avatar: CatImage {
        get {
            return catDetailsModel.avatar
        }
    }
    
    var cat: String {
        get {
            return catDetailsModel.cat
        }
    }
    
    var message: String {
        get {
            return catDetailsModel.message
        }
    }
    
    var banner: CatImage {
        get {
            return catDetailsModel.banner
        }
    }
    
    var age: Int {
        get {
            return catDetailsModel.age
        }
    }
    
    var kind: String {
        get {
            return catDetailsModel.kind
        }
    }
    
    var stars: Int {
        get {
            return catDetailsModel.stars
        }
    }
    
    var follows: Int {
        get {
            return catDetailsModel.follows
        }
    }
    
    var fishes: Int {
        get {
            return catDetailsModel.fishes
        }
    }
    
    var adopted: Int {
        get {
            return catDetailsModel.adopted
        }
    }

}

