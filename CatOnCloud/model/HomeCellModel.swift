//
//  HomeCellModel.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Foundation

struct HomeCellModel {
    var id: String
    var cat: String
    var message: String
    var timestamp: String
    var avatar: CatImage
    var thumbs: [CatImage]
}
