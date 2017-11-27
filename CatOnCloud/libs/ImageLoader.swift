//
//  ImageLoader.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 27/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class ImageLoader {
    public func updateImage(imageView: UIImageView, image: CatImage) {
        updateImage(imageView: imageView, image: image.image)
    }
    
    public func updateImage(imageView: UIImageView, image: String) {
        let url = URL(string: "http://localhost:8080/catnip" + image)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
            }
        }
    }
}
