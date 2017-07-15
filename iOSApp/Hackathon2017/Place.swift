//
//  Place.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation

class Place {
    var name: String?
    var coordinates: [Double]?
    var category: String?
    var address: String?
    var city: String?
    var imageUrl: String?
    var placeDescription: String?
    
    var latitude: Double? {
        return coordinates?.first
    }
    
    var longitude: Double? {
        return coordinates?.last
    }
}
