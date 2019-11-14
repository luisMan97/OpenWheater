//
//  Whater.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import ObjectMapper

struct CPortfolio: Mappable {
    var base: String?
    var clouds: Clouds?
    var cod: Int?
    var coord: Coord?
    var dt: Int?
    var id: Int?
    var main: Main?
    var name: String?
    var weather: Weather?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        base <- map["base"]
        clouds <- map["clouds"]
        cod <- map["cod"]
        coord <- map["coord"]
        dt <- map["dt"]
        id <- map["id"]
        main <- map["main"]
        name <- map["name"]
        weather <- map["weather"]
    }
}

struct Clouds: Mappable {
    var all: Int?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}

struct Coord: Mappable {
    var lat: Float?
    var long: Float?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
    }
}

struct Main: Mappable {
    var humidity: Int?
    var pressure: Int?
    var temp: Int?
    var tempMax: Int?
    var tempMin: Int?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        temp <- map["temp"]
        tempMax <- map["temp_max"]
        tempMin <- map["temp_min"]
    }
}

struct Weather: Mappable {
    var description: String?
    var icon: String?
    var id: Int?
    var main: String?
    
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        description <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
}
