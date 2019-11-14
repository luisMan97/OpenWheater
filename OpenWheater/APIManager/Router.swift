//
//  Router.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import Alamofire

enum ApiManagerConstants {
    enum keys {
        static let cpsEndpoint = "https://api.openweathermap.org/data/2.5/"
    }
}

enum Router: URLRequestConvertible {
    
    case GetWeatherByCity([String: AnyObject])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .GetWeatherByCity:
            return .get
        }
    }
    
    var path: String {
        switch self {
            case .GetWeatherByCity:
                return "weather"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: ApiManagerConstants.keys.cpsEndpoint)
        
        var mutableURLRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
        mutableURLRequest.httpMethod = method.rawValue
        
        print("URL Service: ", mutableURLRequest)
        
        switch self {
            case .GetWeatherByCity(let parameters):
                return try Alamofire.URLEncoding.default.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
        }
    }
    
}

