//
//  HomeViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

class HomeViewModel {
    var homeModels: [HomeCellModel]
    
    init(models: [HomeCellModel]) {
        self.homeModels = models
    }
    
    var count: Int {
        get {
            return homeModels.count
        }
    }
    
    func getCellViewModel(index: Int) -> HomeCellViewModel {
        return HomeCellViewModel(model: homeModels[index])
    }
}
