//
//  Event.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Event: Mappable {
    var title: String?
    var description: String?
    var date: Date?
    var image: UIImage?
    var startPlace: Place?
    var endPlace: Place?
    var places: [Place]?
    
    required init?(map: Map){
    }
    
    convenience init() {
        self.init()
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.description <- map["description"]
        self.date <- map["date"]
        self.image <- map["image"]
        self.startPlace <- map["startPlace"]
        self.endPlace <- map["endPlace"]
        self.places <- map["places"]
    }
}
