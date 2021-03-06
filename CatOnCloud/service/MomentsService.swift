//
//  MomentsService.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 25/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class MomentsService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlMoments = URL(string: "http://localhost:8080/catnip/moment/")!.absoluteURL
    private let momentsTranslator = MomentsTranslator()
    
    public func performMoments(success: @escaping (Moments) -> Void, failure: @escaping (APIError) -> Void) {
        
        var request = URLRequest(url: urlMoments)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let moments = data.flatMap(self.momentsTranslator.translate) {
                success(moments)
            } else {
                failure(APIError(message: "moments parse error"))
            }
        }
        
        task.resume()
    }
}
