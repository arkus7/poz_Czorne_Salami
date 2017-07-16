//
//  DataManager.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var user: User?
    var places: [Place]?
}
