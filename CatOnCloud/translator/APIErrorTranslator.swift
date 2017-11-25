//
//  APIErrorTranslator.swift
//  CatOnCloud
//
//  Created by Xingxin Zeng  on 01/11/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import UIKit

class APIErrorTranslator {

    func translate(data: Data?, error: Error?) -> APIError {
        let message = data.flatMap(translateErrorMessage) ??
            error?.localizedDescription ?? "Unknown error"
        
        return APIError(message: message)
    }

    private func translateErrorMessage(data: Data) -> String? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        let dict = dataJson as? [String: Any]
        return dict?["message"] as? String
    }
}
