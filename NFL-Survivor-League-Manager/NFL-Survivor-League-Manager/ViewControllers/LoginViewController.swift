//
//  LoginViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/25/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var loginViewer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tappedLogin(_ sender: Any) {
        
        if(!((self.usernameTextField.text?.isEmpty)!) && !((self.passwordTextField.text?.isEmpty)!)) {
            ParseAPIManager.logInUser(self.usernameTextField.text!, self.passwordTextField.text!) { (user, error) in
                if user != nil {
                    //print(user.username!)
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else if let error = error {
                    print(error.localizedDescription)
                    self.issueAlert(Message: "Invalid username/password.")
                }
            }
        } else {
            print("Please fill out fields.")
            self.issueAlert(Message: "Please fill out fields.")
        }
    }
    
    func issueAlert(Message: String, Title: String = ""){
        let alert1 = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alert1.addAction(OKAction)
        self.present(alert1, animated: true)
    }

}


