//
//  APIManager.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import Alamofire

class APIManager {
    
    // Internal Typealias
    typealias CallServiceHandler = ((Any?, _ error: Error?) -> Void)?
    
    func callServiceObject(parameters: [String: AnyObject]?, service: Router, withCompletionBlock: CallServiceHandler) {
        Alamofire.request(service)
            .responseJSON { response in
                if response.result.isSuccess {
                    if response.response?.statusCode == 404 {
                        let error = NSError(domain: "error", code: 404, userInfo: ["message": "city not found"])
                        
                        withCompletionBlock?(nil, error)
                        
                        return
                    }
                    
                    withCompletionBlock?(response.result.value, nil)
                } else {
                    withCompletionBlock?(nil, response.result.error)
                }
        }
    }

}
