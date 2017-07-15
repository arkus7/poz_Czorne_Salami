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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }

    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileAvatarTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileAvatarTableViewCell.reuseIdentifier())
        self.tableView.register(UINib(nibName: "ProfileNameLastnameTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileNameLastnameTableViewCell.reuseIdentifier())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.imageViewDim + 40
        } else if indexPath.row == 1 {
            return 105
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return self.setupAvatarCell(tableView: tableView, indexPath: indexPath, imageViewDim: self.imageViewDim)
        } else if indexPath.row == 1 {
            return self.setupNameLastnameCell(tableView: tableView, indexPath: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    
    func setupAvatarCell(tableView: UITableView, indexPath: IndexPath, imageViewDim: CGFloat) -> ProfileAvatarTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAvatarTableViewCell.reuseIdentifier(), for: indexPath) as! ProfileAvatarTableViewCell
        cell.setupCell(imageDim: imageViewDim)
        return cell
    }
    
    func setupNameLastnameCell(tableView: UITableView, indexPath: IndexPath) -> ProfileNameLastnameTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileNameLastnameTableViewCell.reuseIdentifier(), for: indexPath) as! ProfileNameLastnameTableViewCell
        return cell
    }
    
    

}
