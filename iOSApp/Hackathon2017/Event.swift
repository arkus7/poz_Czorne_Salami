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

class EventDetails: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var date: Date?
    var image: UIImage?
    var startPlace: Place?
    var endPlace: Place?
    var places: [Place]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.date <- map["date"]
        self.image <- map["image"]
        self.startPlace <- map["startPlace"]
        self.endPlace <- map["endPlace"]
        self.places <- map["places"]
    }
    
    convenience init?() {
        self.init(map: Map(mappingType: .fromJSON, JSON: [:]))
    }
}

class Event : Mappable {
    var author: String?
    var joinedUsers: [String]?
    var details: EventDetails?
    var match: Double?
    
    required init?(map: Map) {
        
    }
    
    convenience init?() {
        self.init(map: Map(mappingType: .fromJSON, JSON: [:]))
    }
    
    func mapping(map: Map) {
        self.author <- map["author"]
        self.joinedUsers <- map["joinedUsers"]
        self.details <- map["event"]
        self.match <- map["probability"]
    }
}

class EventsResponse : Mappable {
    var events: [Event]?
    
    func mapping(map: Map) {
        events <- map["events"]
    }
    
    required init?(map: Map) {
        
    }
}
