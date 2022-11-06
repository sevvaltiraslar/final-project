//
//  ProfileViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleLabel.text = "PROFILE"
        nameLabel.text = Auth.auth().currentUser?.email
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
