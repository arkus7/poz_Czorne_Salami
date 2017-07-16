//
//  EventsViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//    var events: [Event] = [Event(), Event(), Event(), Event(), Event()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let font = UIFont.systemFont(ofSize: 18)
        self.segmentedControl.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: EventsTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: EventsTableViewCell.reuseIdentifier())
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Events", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "EventsDetailsViewController") as! EventsDetailsViewController
//        viewController.event = self.events[indexPath.section]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.reuseIdentifier(), for: indexPath) as! EventsTableViewCell
//        cell.setupCell(event: Event())
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}