//
//  ProfileCalendarPlacesButtonsTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

protocol ProfileCalendarPlacesDelegate {
    func calendarTapped()
    func localizationsTapped()
    func saveTapped()
}

class ProfileCalendarPlacesButtonsTableViewCell: UITableViewCell {
    
    var delegate: ProfileCalendarPlacesDelegate?
    
    @IBAction func calendarButtonTapped(_ sender: Any) {
        self.delegate?.calendarTapped()
    }
    
    @IBAction func localizationsButtonTapped(_ sender: Any) {
        self.delegate?.localizationsTapped()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.delegate?.saveTapped()
    }
    
    class func reuseIdentifier() -> String {
        return "ProfileCalendarPlacesButtonsTableViewCell"
    }
}
