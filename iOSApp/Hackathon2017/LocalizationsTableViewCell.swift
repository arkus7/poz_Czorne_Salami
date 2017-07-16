//
//  LocalizationsTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class LocalizationsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var selectSwitch: UISwitch!
    
    

    func setupCell(place: Place) {
        titleLabel.text = place.name
        subtitleLabel.text = place.placeDescription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    class func reuseIdentifier() -> String {
        return "LocalizationsTableViewCell"
    }
    
}
