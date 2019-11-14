//
//  Main.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct Main: Mappable {
    var temp: Int?
    var humidity: Int?
    var pressure: Int?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        temp     <- map["temp"]
        humidity <- map["humidity"]
        pressure <- map["pressure"]
    }
}
