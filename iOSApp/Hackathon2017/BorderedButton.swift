//
//  BorderedButton.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}
