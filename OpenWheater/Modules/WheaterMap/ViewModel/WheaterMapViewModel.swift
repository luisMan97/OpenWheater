//
//  WheaterMapViewModel.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class WheaterMapViewModel {
    
    // Internal Typealias
    typealias CallServiceHandler = ((_ onSuccess: Bool?, _ onError: Error?) -> Void)?
    
    // MARK: - Internal Methods
    
    func getWheaterByCity(handler: CallServiceHandler) {
        let params = ["q": "London,uk",
                      "appid": "d7e6204225106a26ef35751b8e152076",
                      "units": "metric",
                      "lang": "es"] as [String: AnyObject]
        
        APIManager().callServiceObject(parameters: nil, service: .GetWeatherByCity(params)) { [weak self] (result, error) in
            guard let _ = self else {
                handler?(nil, nil)
                return
            }
            
            if let result = result {
                print("getWheaterByCity JSON", result)
                    
                handler?(true, nil)
            } else if let error = error {
                handler?(false, error)
            }
        }
    }

}
