//
//  SignUpViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/25/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworldTextField: UITextField!
    override var shouldAutorotate: Bool{
        return false    //disable auto-rotation for this view.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapRegister(_ sender: Any) {
        if((self.usernameTextField.text?.isEmpty)! || (self.emailTextField.text?.isEmpty)! || (self.passworldTextField.text?.isEmpty)!) {
             self.issueAlert(Message: "Please fill out all the fields.")
        } else {
            if isCorrectPasswordLength(pwd: self.passworldTextField.text!){
                ParseAPIManager.signUpUser(self.usernameTextField.text!, password: self.passworldTextField.text!, self.emailTextField.text!) { (user, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if user != nil {
                        // print("Success in creating user:")
                        //print(user.username!)
                        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                        
                    }
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func isCorrectPasswordLength(pwd: String) -> Bool {
        let pass = self.passworldTextField.text
        if ((pass!.count) > 16) || ((pass!.count) < 8){
            self.issueAlert(Message: "password must have length from 8 to 16 characters.")
            return false
        } else {
            return true
        }
    }
    
    func issueAlert(Message: String, Title: String = ""){
        let alert1 = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alert1.addAction(OKAction)
        self.present(alert1, animated: true)
    }


}
