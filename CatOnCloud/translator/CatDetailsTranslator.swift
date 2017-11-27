//
//  CatDetailsTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit


class CatDetailsTranslator {
    let defaultImageUrl = ""
    let catImageTranslator = CatImageTranslator()
    
    func translate(data: Data) -> CatDetails? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        
        let dict = dataJson as? [String: Any]
        
        var catDetails: CatDetails? = nil
        if let avatar = catImageTranslator.translate(dataJson: dict?["avatar"] as? [String : Any]),
            let cat = dict?["cat"] as? String,
            let message = dict?["message"] as? String,
            let banner = catImageTranslator.translate(dataJson: dict?["banner"] as? [String : Any]),
            let age = dict?["age"] as? Int,
            let kind = dict?["kind"] as? String,
            let stars = dict?["stars"] as? Int,
            let follows = dict?["follows"] as? Int,
            let fishes = dict?["fishes"] as? Int,
            let adopted = dict?["adopted"] as? Int {
            catDetails = CatDetails(avatar: avatar, cat: cat, message: message, banner: banner, age: age, kind: kind, stars: stars, follows: follows, fishes: fishes, adopted: adopted)
        }
        
        return catDetails
    }
}

