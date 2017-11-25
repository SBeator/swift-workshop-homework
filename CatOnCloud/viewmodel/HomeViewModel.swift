//
//  HomeViewModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

let cellModel1 = HomeCellModel(cat: "Miao",
                              message: "Miao Miao",
                              timestamp: "2017-10-23T02:03:21.3232")

let cellModel2 = HomeCellModel(cat: "Cat",
                              message: "This is a cat",
                              timestamp: "2017-10-23T02:03:21.3232")

let mockModels = [cellModel1, cellModel2]

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
