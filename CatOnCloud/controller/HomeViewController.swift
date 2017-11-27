//
//  HomeViewController.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit
import Rswift

class HomeViewController: UIViewController {
    var viewModel: HomeViewModel? = nil
    
    @IBOutlet weak var table: UITableView!
    
    private let momentsService = MomentsService()
    private var selectedCellViewModel: HomeCellViewModel?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        momentsService.performMoments(success: performMomentsSuccess, failure: performMomentsFailure)
    }
    
    func performMomentsSuccess(moments: Moments) {
        let homeCellModels = moments.cats.map { (cat) -> HomeCellModel in
            HomeCellModel(id: cat.id, cat: cat.cat, message: cat.message, timestamp: cat.timestamp, avatar: cat.avatar, thumbs: cat.thumbs)
        }
        
        viewModel = HomeViewModel(models: homeCellModels)
        
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func performMomentsFailure(apiError: APIError) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CatViewController {
            vc.selectedCellViewModel = self.selectedCellViewModel
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeTableVIewCell, for: indexPath) else {
            fatalError("Could not dequeue HomeTableViewCell")
        }
        
        if let cellViewModel = viewModel?.getCellViewModel(index: indexPath.item) {
            cell.updateContent(viewModel: cellViewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCellViewModel = viewModel?.getCellViewModel(index: indexPath.item)
        performSegue(withIdentifier: "catPageSegue", sender: self)
    }
}
