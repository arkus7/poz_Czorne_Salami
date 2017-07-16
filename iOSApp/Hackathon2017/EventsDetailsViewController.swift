//
//  EventsDetailsViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class EventsDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!

    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 105.0
        self.tableView.register(UINib(nibName: EventsDetailsTopTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: EventsDetailsTopTableViewCell.reuseIdentifier())
        self.tableView.register(UINib(nibName: EventsDetailsDescriptionTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: EventsDetailsDescriptionTableViewCell.reuseIdentifier())
        self.tableView.register(UINib(nibName: EventsDetailsMapTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: EventsDetailsMapTableViewCell.reuseIdentifier())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 16
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsDetailsTopTableViewCell.reuseIdentifier(), for: indexPath) as! EventsDetailsTopTableViewCell
                    cell.setupCell(event: event)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsDetailsDescriptionTableViewCell.reuseIdentifier(), for: indexPath) as! EventsDetailsDescriptionTableViewCell
                    cell.setupCell(event: event)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventsDetailsMapTableViewCell.reuseIdentifier(), for: indexPath) as! EventsDetailsMapTableViewCell
                    cell.setupCell(event: event)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 105
        } else if indexPath.section == 1 {
            return UITableViewAutomaticDimension
        } else {
            return 250
        }
    }
}
