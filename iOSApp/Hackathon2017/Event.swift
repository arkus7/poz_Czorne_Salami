//
//  Event.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import UIKit

class Event {
    var title: String
    var description: String
    var date: Date
    var image: UIImage
    
    init(title: String, description: String, date: Date, image: UIImage) {
        self.title = title
        self.description = description
        self.date = date
        self.image = image
    }
}
