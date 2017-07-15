//
//  ProfileAvatarTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class ProfileAvatarTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarImageWidthConstraint: NSLayoutConstraint!
    
    func setupCell(imageDim: CGFloat) {
        self.avatarImageWidthConstraint.constant = imageDim
        self.avatarImageHeightConstraint.constant = imageDim
    }
    
    class func reuseIdentifier() -> String {
        return "ProfileAvatarCell"
    }
    
}
