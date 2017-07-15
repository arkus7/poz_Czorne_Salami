//
//  AppDelegate.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true
        
        var storyboardName: String
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn") {
            storyboardName = "Events"
        } else {
            storyboardName = "Login"
        }
        
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        self.window?.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }
}

