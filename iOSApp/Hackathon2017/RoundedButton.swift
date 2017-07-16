//
//  RoundedButton.swift
//  Hackathon2017
//
//  Created by Patryk Molka on 16/07/2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}
