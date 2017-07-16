//
//  CalendarTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var dayTitleLabel: UILabel!
    
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var twelveButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var eighteenButton: UIButton!
    @IBOutlet weak var twentyOneButton: UIButton!
    
    var isNine: Bool = false
    var isTwelve: Bool = false
    var isFifteen: Bool = false
    var isEighteen: Bool = false
    var isTwentyOne: Bool = false
    
    var selectedDays: Array<String> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    @IBAction func nineButtonTapped(_ sender: Any) {
        if !self.isNine {
            self.selectedDays.append("9")
            self.isNine = true
            self.nineButton.backgroundColor = UIColor("#7fb851")
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "9"}
            self.isNine = false
            self.nineButton.backgroundColor = .clear
        }
    }
    
    @IBAction func twelveButtonTapped(_ sender: Any) {
        if !self.isTwelve {
            self.selectedDays.append("12")
            self.isTwelve = true
            self.twelveButton.backgroundColor = UIColor("#7fb851")
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "12"}
            self.isTwelve = false
            self.twelveButton.backgroundColor = .clear
        }
    }
    
    @IBAction func fifteenButtonTapped(_ sender: Any) {
        if !self.isFifteen {
            self.selectedDays.append("15")
            self.isFifteen = true
            self.fifteenButton.backgroundColor = UIColor("#7fb851")
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "15"}
            self.isFifteen = false
            self.fifteenButton.backgroundColor = .clear
        }
    }
    
    @IBAction func eighteenButtonTapped(_ sender: Any) {
        if !self.isEighteen {
            self.selectedDays.append("18")
            self.isEighteen = true
            self.eighteenButton.backgroundColor = UIColor("#7fb851")
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "18"}
            self.isEighteen = false
            self.eighteenButton.backgroundColor = .clear
        }
    }
    
    @IBAction func twentyOneButtonTapped(_ sender: Any) {
        if !self.isTwentyOne {
            self.selectedDays.append("21")
            self.isTwentyOne = true
            self.twentyOneButton.backgroundColor = UIColor("#7fb851")
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "21"}
            self.isTwentyOne = false
            self.twentyOneButton.backgroundColor = .clear
        }
    }
    
    class func reuseIdentifier() -> String {
        return "CalendarTableViewCell"
    }
    
}
