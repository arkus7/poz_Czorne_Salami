//
//  EventsTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import AFDateHelper
import SDWebImage

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var placeIcon: CircularImageNotBordered!
    
    
    func setupCell(event: Event) {
        self.titleLabel.text = event.details?.title
        self.descriptionLabel.text = event.details?.description
        self.dateLabel.text = event.details?.date?.toString()
        
        self.placeIcon.sd_setImage(with: URL(string: (getPlaseIconURL((event.details?.startPlace!)!))), placeholderImage: UIImage(named: "users_count"))
    }
    
    
    func getPlaseIconURL(_ id:Int) -> String {
        for place in DataManager.shared.places! {
            if(id == place.id){
                return place.imageUrl!;
            }
        }
        return "";
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
