//
//  Coord.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct Coord: Mappable {
    var lat: Float?
    var lon: Float?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}
