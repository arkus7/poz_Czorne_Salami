//
//  ProfileViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var imageViewDim: CGFloat!
    weak var namesDelegate : ProfileNameLastnameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageViewDim = self.view.layer.frame.size.width * 0.6
        self.setupTableView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileAvatarTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileAvatarTableViewCell.reuseIdentifier())
        self.tableView.register(UINib(nibName: "ProfileNameLastnameTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileNameLastnameTableViewCell.reuseIdentifier())
        self.tableView.register(UINib(nibName: "ProfileCalendarPlacesButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileCalendarPlacesButtonsTableViewCell.reuseIdentifier())
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.imageViewDim + 40
        } else if indexPath.row == 1 {
            return 105
        } else {
            return 152
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return self.setupAvatarCell(tableView: tableView, indexPath: indexPath, imageViewDim: self.imageViewDim)
        } else if indexPath.row == 1 {
            return self.setupNameLastnameCell(tableView: tableView, indexPath: indexPath)
        } else {
            return self.setupProfileCalendarPlacesButtonsCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func setupAvatarCell(tableView: UITableView, indexPath: IndexPath, imageViewDim: CGFloat) -> ProfileAvatarTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAvatarTableViewCell.reuseIdentifier(), for: indexPath) as! ProfileAvatarTableViewCell
        cell.setupCell(imageDim: imageViewDim)
        return cell
    }
    
    func setupNameLastnameCell(tableView: UITableView, indexPath: IndexPath) -> ProfileNameLastnameTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileNameLastnameTableViewCell.reuseIdentifier(), for: indexPath) as! ProfileNameLastnameTableViewCell
        
        let user = DataManager.shared.user
        cell.nameTextField.text = user?.name
        cell.surnameTextField.text = user?.surname
        self.namesDelegate = cell
        return cell
    }
    
    func setupProfileCalendarPlacesButtonsCell(tableView: UITableView, indexPath: IndexPath) -> ProfileCalendarPlacesButtonsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCalendarPlacesButtonsTableViewCell.reuseIdentifier(), for: indexPath) as! ProfileCalendarPlacesButtonsTableViewCell
        cell.delegate = self
        return cell
    }

}

extension ProfileViewController: ProfileCalendarPlacesDelegate {
    func calendarTapped() {
        let storyboard = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func localizationsTapped() {
        print("Localizations tapped")
//        self.performSegue(withIdentifier: "LocalizationsSegue", sender: nil)
    }
    
    func saveTapped() {
        var user: User
        if let savedUser = DataManager.shared.user {
            user = savedUser
        } else {
            user = User()!
        }
        user.name = namesDelegate?.getName()
        user.surname = namesDelegate?.getSurname()
        ApiClient.shared.updateUser(user, successCallback: { 
            print("success")
            DataManager.shared.user = user
        }, errorCallback: {
            print("error")
        })
        print("Save tapped")
    }
}
