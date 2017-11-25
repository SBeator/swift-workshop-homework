//
//  LoginService.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class LoginService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlLogin = URL(string: "http://localhost:8080/catnip/login/")!.absoluteURL
    private let loginCredentialTranslater = LoginCredentialTranslator()
    private let loginKeyTranslater = LoginKeyTranslator()
    private let apiErrorTranslater = APIErrorTranslator()
    
    public func performLogin(credential: LoginCredential, success: @escaping (LoginKey) -> Void, failure: @escaping (APIError) -> Void) {
//        let error = APIError(message: "balala, this is just a test error")
//        failure(error)
        var request = URLRequest(url: urlLogin)
        request.httpMethod = "POST"
        request.httpBody = loginCredentialTranslater.translate(credential: credential)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
//            let error = APIError(message: error?.localizedDescription ?? "xx")
//            failure(error)
            if let key = data.flatMap(self.loginKeyTranslater.translate) {
                success(key)
            } else {
                
                let error = self.apiErrorTranslater.translate(data: data, error: error)
//                let error = APIError(message: error?.localizedDescription ?? "xx")
                failure(error)
            }
        }
        
        task.resume()
    }
}
