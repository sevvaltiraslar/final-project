//
//  ProfileViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: Buttons actions
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Error")
        }
    }
    
}
