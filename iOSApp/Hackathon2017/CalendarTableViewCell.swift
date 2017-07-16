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
    
    var day: WeekDay!
    
    var dataLoaded: Bool = false
    
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
            self.nineButton.setTitleColor(UIColor("#ffffff"), for: .normal)
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "9"}
            self.isNine = false
            self.nineButton.backgroundColor = .clear
            self.nineButton.setTitleColor(UIColor("#7fb851"), for: .normal)
        }
        updateTimetable()
    }
    
    @IBAction func twelveButtonTapped(_ sender: Any) {
        if !self.isTwelve {
            self.selectedDays.append("12")
            self.isTwelve = true
            self.twelveButton.backgroundColor = UIColor("#7fb851")
            self.twelveButton.setTitleColor(UIColor("#ffffff"), for: .normal)
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "12"}
            self.isTwelve = false
            self.twelveButton.backgroundColor = .clear
            self.twelveButton.setTitleColor(UIColor("#7fb851"), for: .normal)
        }
        updateTimetable()
    }
    
    @IBAction func fifteenButtonTapped(_ sender: Any) {
        if !self.isFifteen {
            self.selectedDays.append("15")
            self.isFifteen = true
            self.fifteenButton.backgroundColor = UIColor("#7fb851")
            self.fifteenButton.setTitleColor(UIColor("#ffffff"), for: .normal)
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "15"}
            self.isFifteen = false
            self.fifteenButton.backgroundColor = .clear
            self.fifteenButton.setTitleColor(UIColor("#7fb851"), for: .normal)
        }
        updateTimetable()
    }
    
    @IBAction func eighteenButtonTapped(_ sender: Any) {
        if !self.isEighteen {
            self.selectedDays.append("18")
            self.isEighteen = true
            self.eighteenButton.backgroundColor = UIColor("#7fb851")
            self.eighteenButton.setTitleColor(UIColor("#ffffff"), for: .normal)
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "18"}
            self.isEighteen = false
            self.eighteenButton.backgroundColor = .clear
            self.eighteenButton.setTitleColor(UIColor("#7fb851"), for: .normal)
        }
        updateTimetable()
    }
    
    @IBAction func twentyOneButtonTapped(_ sender: Any) {
        if !self.isTwentyOne {
            self.selectedDays.append("21")
            self.isTwentyOne = true
            self.twentyOneButton.backgroundColor = UIColor("#7fb851")
            self.twentyOneButton.setTitleColor(UIColor("#ffffff"), for: .normal)
        } else {
            self.selectedDays = self.selectedDays.filter{$0 != "21"}
            self.isTwentyOne = false
            self.twentyOneButton.backgroundColor = .clear
            self.twentyOneButton.setTitleColor(UIColor("#7fb851"), for: .normal)
        }
        updateTimetable()
    }
    
    class func reuseIdentifier() -> String {
        return "CalendarTableViewCell"
    }
    
    func loadData() {
        guard let day = self.day, let user = DataManager.shared.user else { return }
        var hours: [Int]?
        switch day {
        case .monday:
            hours = user.timetable?.monday
        case .tuesday:
            hours = user.timetable?.tuesday
        case .wednesday:
            hours = user.timetable?.wednesday
        case .thursday:
            hours = user.timetable?.thursday
        case .friday:
            hours = user.timetable?.friday
        case .saturday:
            hours = user.timetable?.saturday
        case .sunday:
            hours = user.timetable?.sunday
        }
        guard let selectedHours = hours, selectedHours.count > 0 else { return }
        
        if selectedHours.contains(9) {
            nineButtonTapped(self)
        }
        if selectedHours.contains(12) {
            twelveButtonTapped(self)
        }
        if selectedHours.contains(15) {
            fifteenButtonTapped(self)
        }
        if selectedHours.contains(18) {
            eighteenButtonTapped(self)
        }
        if selectedHours.contains(21) {
            twentyOneButtonTapped(self)
        }
        dataLoaded = true
    }
    
    func updateTimetable() {
        if !dataLoaded { return }
        if DataManager.shared.user == nil {
            DataManager.shared.user = User()
        }
        guard let user = DataManager.shared.user else { return }
        if user.timetable == nil {
            user.timetable = TimeTable()
        }
        guard let timetable = user.timetable, let day = self.day else { return }
        let selectedHours = self.selectedDays.map { Int($0)! }
        switch day {
        case .monday:
            timetable.monday = selectedHours
        case .tuesday:
            timetable.tuesday = selectedHours
        case .wednesday:
            timetable.wednesday = selectedHours
        case .thursday:
            timetable.thursday = selectedHours
        case .friday:
            timetable.friday = selectedHours
        case .saturday:
            timetable.saturday = selectedHours
        case .sunday:
            timetable.sunday = selectedHours
        }
        
        ApiClient.shared.updateUser(user, successCallback: nil, errorCallback: nil)
    }
    
}

enum WeekDay: Int {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}
