//
//  ProfileNameLastnameTableViewCell.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

protocol ProfileNameLastnameDelegate : NSObjectProtocol {
    func getName() -> String
    func getSurname() -> String
}

class ProfileNameLastnameTableViewCell: UITableViewCell, ProfileNameLastnameDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    class func reuseIdentifier() -> String {
        return "ProfileNameLastnameTableViewCell"
    }
    
    func getName() -> String {
        return nameTextField.text ?? ""
    }
    
    func getSurname() -> String {
        return surnameTextField.text ?? ""
    }
}
