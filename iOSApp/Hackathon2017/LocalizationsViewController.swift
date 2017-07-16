//
//  LocalizationsViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

protocol LocalizationsProtocol: NSObjectProtocol {
    func changeSwitchStateTo(value: Bool)
}

class LocalizationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, LocalizationsCellProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var event: EventDetails?
    var placesList: [Int] = []
    var didSetStartPoint: Bool = false
    weak var delegate: LocalizationsProtocol?
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        
        if self.event != nil {
            let alertController = UIAlertController(title: "", message: "Aby wybrać miejsce spotkania przytrzymaj palec na odpowiedniej lokalizacji", preferredStyle: .alert)
            let action = UIAlertAction(title: "Zamknij", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
            let rightButtonItem = UIBarButtonItem.init(
                title: "Zakończ",
                style: .done,
                target: self,
                action: #selector(rightButtonAction)
            )
            
            self.navigationItem.rightBarButtonItem = rightButtonItem
            
            let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(LocalizationsViewController.longPress(_:)))
            longPressGesture.minimumPressDuration = 1.0
            longPressGesture.delegate = self
            self.tableView.addGestureRecognizer(longPressGesture)
        }
    }
    
    func didChangeSwitchStateTo(value: Bool, forPlace place: Place) {
        if value {
            self.placesList.append(place.id!)
        } else {
            self.placesList = self.placesList.filter{$0 != place.id!}
        }
    }
    
    func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = self.tableView.indexPathForRow(at: touchPoint) {
                let cell = self.tableView.cellForRow(at: indexPath) as! LocalizationsTableViewCell
                if !self.didSetStartPoint {
                    self.selectedIndex = indexPath.row
                    self.placesList.insert((DataManager.shared.places?[indexPath.row])!.id!, at: 0)
                    self.didSetStartPoint = true
                    cell.selectSwitch.setOn(true, animated: true)
                    cell.backgroundColor = UIColor("#7fb851")
                } else {
                    self.selectedIndex = nil
                    self.placesList = self.placesList.filter{$0 != (DataManager.shared.places?[indexPath.row])!.id!}
                    self.didSetStartPoint = false
                    cell.selectSwitch.setOn(false, animated: true)
                    cell.backgroundColor = .white
                }
            }
        }
    }
    
    func rightButtonAction() {
        self.event?.startPlace = self.placesList.first
        self.event?.endPlace = self.placesList.first
        self.event?.places = self.placesList
        ApiClient.shared.addEvent(self.event!, successCallback: { 
            self.dismiss(animated: true, completion: nil)
        }) { 
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: LocalizationsTableViewCell.reuseIdentifier(), bundle: nil), forCellReuseIdentifier: LocalizationsTableViewCell.reuseIdentifier())
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let place = DataManager.shared.places?[indexPath.section] else { return }
        
        let alertController = UIAlertController(title: place.name, message: place.placeDescription?.replacingOccurrences(of: "...", with: ""), preferredStyle: .alert)
        let action = UIAlertAction(title: "Zamknij", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataManager.shared.places?.count ?? 0
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
        let cell = tableView.dequeueReusableCell(withIdentifier: LocalizationsTableViewCell.reuseIdentifier(), for: indexPath) as! LocalizationsTableViewCell
        if let place = DataManager.shared.places?[indexPath.section] {
            cell.setupCell(place: place)
        }
        
        if let index = self.selectedIndex {
            if indexPath.section == index {
                cell.backgroundColor = UIColor("#7fb851")
            } else {
                cell.backgroundColor = .white
            }
        }
        
        self.delegate = cell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
