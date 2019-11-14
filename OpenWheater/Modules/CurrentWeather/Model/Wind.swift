//
//  Wind.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct Wind: Mappable {
    var deg: Int?
    var speed: Float?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        deg   <- map["deg"]
        speed <- map["speed"]
    }
}
