//
//  MomentsTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class MomentsTranslator {
    let defaultImageUrl = ""
    let catImageTranslator = CatImageTranslator()
    
    func translate(data: Data) -> Moments? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        
        let dict = dataJson as? [String: Any]
        
        var moments: Moments? = nil
        var catInfomations: [CatInformation]? = nil
        if let momentsJson = dict?["moments"] as? [[String: Any]] {
        
            catInfomations = momentsJson.map({ (moment) -> CatInformation in
                var catInformation: CatInformation? = nil
                
                let avatarJson = moment["avatar"] as? [String: Any]
                let avatar = avatarJson.flatMap(self.catImageTranslator.translate)
                
                var thumbs: [CatImage]? = nil
                if let dataThumbs = moment["thumbs"] as? [[String: Any]] {
                    thumbs = dataThumbs.map({ (dataJson) -> CatImage? in
                        self.catImageTranslator.translate(dataJson: dataJson) ?? CatImage(image: self.defaultImageUrl)
                    }) as? [CatImage]
                }
                
                if avatar != nil && thumbs != nil {
                    if let avatar = avatar,
                        let thumbs = thumbs,
                        let cat = moment["cat"] as? String,
                        let id = moment["id"] as? String,
                        let message = moment["message"] as? String,
                        let timestamp = moment["timestamp"] as? String {
                        catInformation = CatInformation(avatar: avatar, cat: cat, id: id, message: message, thumbs: thumbs, timestamp: timestamp)
                        
                    }
                }
                
                return catInformation!
            })
            
            if (catInfomations != nil) {
                moments = Moments(cats: catInfomations!)
            }
        }
        
        return moments
    }
}
