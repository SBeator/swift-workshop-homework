//
//  CatViewController.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 18/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class CatViewController : UIViewController {
    var selectedCellViewModel: HomeCellViewModel?
    var catViewModel: CatViewModel?
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelStars: UILabel!
    @IBOutlet weak var labelFollows: UILabel!
    @IBOutlet weak var labelFishes: UILabel!
    @IBOutlet weak var labelAdopted: UILabel!
    
    var catDetailsSerivce = CatDetailsService()
    var imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catDetailsSerivce.performMoments(id: selectedCellViewModel!.id, success: performCatDetailsSuccess, failure: performCatDetailsFailure)
    }
    
    func performCatDetailsSuccess(catDetails: CatDetails) {
        catViewModel = CatViewModel(model: catDetails)
        
        updateView()
    }
    
    func performCatDetailsFailure(apiError: APIError) {
        
    }
    
    func updateView() {
        if let model = self.catViewModel {
            self.imageLoader.updateImage(imageView: self.imageBanner, image: model.banner)
            self.imageLoader.updateImage(imageView: self.imageAvatar, image: model.avatar)
            DispatchQueue.main.async {
                self.labelKind.text = model.kind
                self.labelMessage.text = model.message
                self.labelStars.text = String(model.stars) + " stars"
                self.labelFollows.text = String(model.follows) + " follows"
                self.labelFishes.text = String(model.fishes) + " fishes"
                self.labelAdopted.text = String(model.adopted) + " adopted"
            }
        }
    }
}
