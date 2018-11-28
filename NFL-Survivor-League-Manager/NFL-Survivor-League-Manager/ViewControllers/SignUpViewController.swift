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
            print("please fill out all the fields")
        } else {
            ParseAPIManager.signUpUser(self.usernameTextField.text!, password: self.passworldTextField.text!, self.emailTextField.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let user = user {
                    print("Success in creating user:")
                    print(user.username!)
                    self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}
