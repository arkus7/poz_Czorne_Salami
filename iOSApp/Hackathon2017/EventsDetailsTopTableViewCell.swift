//
//  EventsDetailsTopTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import SDWebImage

class EventsDetailsTopTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photo: CircularImageNotBordered!
    @IBOutlet weak var personsLabel: UILabel!
    func setupCell(event: Event) {
        titleLabel.text = event.details?.title
        
        personsLabel.text = "\(event.joinedUsers!.count) osób"
        
//        photo.sd_setImage(with: URL(string: getPlaseIconURL(event.details!.id!))!)
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
        return "EventsDetailsTopTableViewCell"
    }
    
}
