//
//  WheaterMapViewModel.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class WeaterMapViewModel {
    
    // Internal Typealias
    typealias CallServiceHandler = ((_ onSuccess: Bool?, _ onError: Error?) -> Void)?
    
    // Internal Properties
    var weater: Weater?
    
    // MARK: - Internal Methods
    
    func getWeatherByCity(city: String?, handler: CallServiceHandler) {
        if city == "" {
            let error = NSError(domain: "error", code: 401, userInfo: ["message": "The field can't be empty"])
            handler?(false, error)
            return
        }
        
        let parameters = ["q": city,
                          "appid": "d7e6204225106a26ef35751b8e152076",
                          "units": "metric",
                          "lang": "es"] as [String: AnyObject]
        
        APIManager().callServiceObject(parameters: nil, service: .GetWeatherByCity(parameters)) { [weak self] (result, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let result = result {
                if let jsonResponseResult = result as? [String: AnyObject] {
                    print("getWheaterByCity JSON", jsonResponseResult)
                    
                    strongSelf.weater = Weater(JSON: jsonResponseResult)
                }
                
                handler?(true, nil)
            } else if let error = error {
                handler?(false, error)
            }
        }
    }
    
    func getWeatherByLocation(lat: Double, Long: Double, handler: CallServiceHandler) {
        let parameters = ["lat": lat,
                          "lon": Long,
                          "appid": "d7e6204225106a26ef35751b8e152076",
                          "units": "metric",
                          "lang": "es"] as [String: AnyObject]
        
        APIManager().callServiceObject(parameters: nil, service: .GetWeatherByCity(parameters)) { [weak self] (result, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let result = result {
                if let jsonResponseResult = result as? [String: AnyObject] {
                    print("getWeatherByLocation JSON", jsonResponseResult)
                    
                    strongSelf.weater = Weater(JSON: jsonResponseResult)
                }
                
                handler?(true, nil)
            } else if let error = error {
                handler?(false, error)
            }
        }
    }

}
