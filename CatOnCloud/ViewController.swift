//
//  ViewController.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 18/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBAction func loginTouched(_ sender: UIButton) {
        if let username = textFieldUsername.text,
            let password = textFieldPassword.text {
            if LoginViewModel().login(username: username, password: password) {
                self.navigationController?.pushViewController(CatViewController(), animated: true)
            }
        }
    }
}

