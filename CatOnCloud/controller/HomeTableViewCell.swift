//
//  HomeTableViewCell.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCat: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var imageThumb1: UIImageView!
    @IBOutlet weak var imageThumb2: UIImageView!
    @IBOutlet weak var imageThumb3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateContent(viewModel: HomeCellViewModel) {
        
        labelCat.text = viewModel.cat
        labelTime.text = viewModel.time
        labelMessage.text = viewModel.message
        
        self.updateImage(imageView: imageAvatar, relativeImageUrl: viewModel.avatar.image)
        let imageThumbs = [imageThumb1, imageThumb2, imageThumb3]
        
        for index in 0...2 {
            if index < viewModel.thumbs.count {
                self.updateImage(imageView: imageThumbs[index]!, relativeImageUrl: viewModel.thumbs[index].image)
            } else {
                DispatchQueue.main.async {
                    imageThumbs[index]!.isHidden = true
                }
            }
        }
    }
    
    public func updateImage(imageView: UIImageView, relativeImageUrl: String) {
        
        let url = URL(string: "http://localhost:8080/catnip" + relativeImageUrl)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
            }
        }
    }
}
