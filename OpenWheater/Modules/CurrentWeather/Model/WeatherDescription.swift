//
//  WeatherDescription.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct WeatherDescription: Mappable {
    var main: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        main <- map["main"]
    }
}
