//
//  Place.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import ObjectMapper

class Place : Mappable {
    var name: String?
    var coordinates: [Double]?
    var category: String?
    var address: String?
    var city: String?
    var imageUrl: String?
    var placeDescription: String?
    
    required init?(map: Map) {
        
    }
    
    convenience init() {
        self.init()
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.coordinates <- map["coordinates"]
        self.category <- map["category"]
        self.address <- map["address"]
        self.city <- map["city"]
        self.imageUrl <- map["imageUrl"]
        self.placeDescription <- map["description"]
    }
    
    var latitude: Double? {
        return coordinates?.last
    }
    
    var longitude: Double? {
        return coordinates?.first
    }
}
