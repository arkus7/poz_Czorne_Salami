//
//  User.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import ObjectMapper

class TimeTable: Mappable {
    var monday: [Int]?
    var tuesday: [Int]?
    var wednesday: [Int]?
    var thursday: [Int]?
    var friday: [Int]?
    var saturday: [Int]?
    var sunday: [Int]?
    
    required init?(map: Map) {
    
    }
    
    convenience init?() {
        self.init(map: Map(mappingType: .fromJSON, JSON: [:]))
    }
    
    func mapping(map: Map) {
        monday <- map["0"]
        tuesday <- map["1"]
        wednesday <- map["2"]
        thursday <- map["3"]
        friday <- map["4"]
        saturday <- map["5"]
        sunday <- map["6"]
    }
}

class User : Mappable {
    var username: String?
    var name: String?
    var surname: String?
    var timetable: TimeTable?
    var placesIds: [Int]?
    
    required init?(map: Map) {
        
    }
    
    convenience init?() {
        self.init(map: Map(mappingType: .fromJSON, JSON: [:]))
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        surname <- map["surname"]
        timetable <- map["timetable"]
        placesIds <- map["places"]
        username <- map["username"]
    }
}
