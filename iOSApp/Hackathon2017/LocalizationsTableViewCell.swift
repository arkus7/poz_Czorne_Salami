//
//  LocalizationsTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

protocol LocalizationsCellProtocol: NSObjectProtocol {
    func didChangeSwitchStateTo(value: Bool, forPlace place: Place)
}
class LocalizationsTableViewCell: UITableViewCell, LocalizationsProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var selectSwitch: UISwitch!
    
    var place: Place!
    weak var delegate: LocalizationsCellProtocol?
    
    func setupCell(place: Place) {
        titleLabel.text = place.name
        subtitleLabel.text = place.placeDescription
        self.place = place
    }
    
    func changeSwitchStateTo(value: Bool) {
        self.selectSwitch.isOn = !self.selectSwitch.isOn
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    @IBAction func didChangeSwitchState(_ sender: UISwitch) {
        self.delegate?.didChangeSwitchStateTo(value: sender.isOn, forPlace: self.place)
    }
    
    class func reuseIdentifier() -> String {
        return "LocalizationsTableViewCell"
    }
    
}
