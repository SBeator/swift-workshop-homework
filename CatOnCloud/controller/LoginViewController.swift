//
//  ViewController.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 18/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var labelErrorMessage: UILabel!
    
    private let viewModel = LoginViewModel()
    private let loginService = LoginService()
    
    var loginSucessHandler: ((LoginKey) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelErrorMessage.text = viewModel.loginErrorMessage
    }
    
    @IBAction func loginTouched(_ sender: UIButton) {
        if let username = textFieldUsername.text,
            let password = textFieldPassword.text {
            
            let credential = LoginCredential(username: username, password: password)
            
            loginService.performLogin(credential: credential, success: loginSuccess, failure: loginFailure)
            
//            if viewModel.login(username: username, password: password) {
//                self.navigationController?.pushViewController(CatViewController(), animated: true)
//            }
        }
    }
    
    private func loginSuccess(loginKey: LoginKey) {
        dismiss(animated: true, completion: nil)
        
        loginSucessHandler?(loginKey)
    }
    
    private func loginFailure(apiError: APIError) {
        viewModel.loginError = apiError
        
        DispatchQueue.main.async {
            self.labelErrorMessage.text = self.viewModel.loginErrorMessage
        }
    }
}

