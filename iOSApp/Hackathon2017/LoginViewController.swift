//
//  LoginViewController.swift
//  Hackathon2017
//
//  Created by Jakub Janicki on 15.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
            destination.imageViewDim = self.view.layer.frame.size.width * 0.6
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
}

