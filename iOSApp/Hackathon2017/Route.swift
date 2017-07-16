//
//  Route.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import ObjectMapper

class Route : Mappable {
    var points: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.points <- map["points"]
    }
}
