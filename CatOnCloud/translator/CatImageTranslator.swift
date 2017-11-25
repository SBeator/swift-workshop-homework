//
//  CatImageTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class CatImageTranslator {

    func translate(dataJson: [String: Any]?) -> CatImage? {
        let image = dataJson?["image"] as? String
        return image.map(CatImage.init)
    }
}
