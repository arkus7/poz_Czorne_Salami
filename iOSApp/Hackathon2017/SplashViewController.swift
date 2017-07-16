//
//  SplashViewController.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ApiClient.shared.getPlaces(successCallback: { (places) in
            DataManager.shared.places = places
            self.openNextScreen()
        }, errorCallback: {
            self.openNextScreen()
        })
    }
    
    func openNextScreen() {
        var storyboardName: String
        if UserDefaults.standard.string(forKey: "token") != nil {
            storyboardName = "Events"
        } else {
            storyboardName = "Login"
        }
        
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        self.present(storyboard.instantiateInitialViewController()!, animated: true, completion: nil)
    }

}
