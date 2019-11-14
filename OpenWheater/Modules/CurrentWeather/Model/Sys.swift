//
//  Sys.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct Sys: Mappable {
    var sunrise: Int?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        sunrise <- map["sunrise"]
    }
}
