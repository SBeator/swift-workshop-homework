//
//  CatDetailsService.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class CatDetailsService{
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let catDetailsTranslator = CatDetailsTranslator()
    
    public func performMoments(id: String, success: @escaping (CatDetails) -> Void, failure: @escaping (APIError) -> Void) {
        let urlCatDetails = URL(string: "http://localhost:8080/catnip/moment/" + id)!.absoluteURL

        var request = URLRequest(url: urlCatDetails)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let catDetails = data.flatMap(self.catDetailsTranslator.translate) {
                success(catDetails)
            } else {
                failure(APIError(message: "cat details parse error"))
            }
        }
        
        task.resume()
    }
}
