//
//  Weater.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import ObjectMapper

struct Weater: Mappable {
    var weatherDescription: [WeatherDescription]?
    var main: Main?
    var name: String?
    var coord: Coord?
    var wind: Wind?
    var sys: Sys?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        weatherDescription <- map["weather"]
        main               <- map["main"]
        name               <- map["name"]
        coord              <- map["coord"]
        wind               <- map["wind"]
        sys                <- map["sys"]
    }
}











