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

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tappedLogin(_ sender: Any) {
        ParseAPIManager.logInUser("", "") { (user, error) in
            if let user = user {
                user.initUserInfo()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}
