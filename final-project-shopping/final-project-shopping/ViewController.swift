//
//  ViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var pageTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleLabel.text = "AUTH"
    }
    
    // MARK: Button actions
    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != nil && passwordText.text != nil {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
                }
            }
        } else {
            makeAlert(title: "Error", message: "Please do not leave the mail or password field blank.")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != nil && passwordText.text != nil {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
                }
            }
        } else {
            makeAlert(title: "Error", message: "Please do not leave the mail or password field blank.")
        }
    }
    
    // MARK: Functions
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

