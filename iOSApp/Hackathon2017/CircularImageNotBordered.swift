//
//  CircularImageNotBordered.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class CircularImageNotBordered: UIImageView {
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
