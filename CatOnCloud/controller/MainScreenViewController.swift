//
//  MainScreenViewController.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    private let viewModel = MainScreenViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        performLogin()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LoginViewController {
            vc.loginSucessHandler = loginSuccess
        }
    }

    private func performLogin() {
        if viewModel.shouldPerformLogin {
            performSegue(withIdentifier: "loginSegue", sender: self)
        } else {
            performSegue(withIdentifier: "homePageSegue", sender: self)
        }
    }
    
    private func loginSuccess(loginKey: LoginKey) {
        viewModel.loginKey = loginKey
        performSegue(withIdentifier: "homePageSegue", sender: self)
    }
}
