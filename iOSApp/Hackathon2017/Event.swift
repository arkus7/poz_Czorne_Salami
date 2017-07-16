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
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.description <- map["description"]
        self.date <- map["date"]
        self.image <- map["image"]
    }
}
