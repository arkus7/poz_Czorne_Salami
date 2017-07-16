//
//  EventsTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import AFDateHelper

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setupCell(event: Event) {
        self.titleLabel.text = event.details?.title
        self.descriptionLabel.text = event.details?.description
        self.dateLabel.text = event.details?.date?.toString()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    class func reuseIdentifier() -> String {
        return "EventsTableViewCell"
    }
    
}
