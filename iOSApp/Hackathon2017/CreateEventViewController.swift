//
//  CreateEventViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.descriptionTextView.placeholder = "Opis"
        self.descriptionTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        self.descriptionTextView.layer.borderWidth = 1.0
        self.descriptionTextView.layer.cornerRadius = 5
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let event = EventDetails()
        event?.title = self.nameLabel.text!
        event?.description = self.descriptionTextView.text!
        event?.date = self.datePicker.date
        
        let storyboard = UIStoryboard(name: "Localizations", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! LocalizationsViewController
        viewController.event = event
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
