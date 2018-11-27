//
//  ParseAPIManager.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/25/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse
/*
 PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
 (user , error) in
 if user != nil {
 self.performSegue(withIdentifier: "logInSegue", sender: nil)
 } else if let error = error {
 print(error.localizedDescription)
 }
 }
 */
class ParseAPIManager {
    static func logInUser(_ username: String, _ password: String, completion: @escaping(User?, Error?) -> ()) {
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if let user = user {
                completion(user as? User, nil)
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
}
