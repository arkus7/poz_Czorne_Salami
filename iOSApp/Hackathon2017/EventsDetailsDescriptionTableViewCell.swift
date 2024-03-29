//
//  EventsDetailsDescriptionTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class EventsDetailsDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    func setupCell(event: Event) {
        self.descriptionLabel.text = event.details?.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    class func reuseIdentifier() -> String {
        return "EventsDetailsDescriptionTableViewCell"
    }
    
}
