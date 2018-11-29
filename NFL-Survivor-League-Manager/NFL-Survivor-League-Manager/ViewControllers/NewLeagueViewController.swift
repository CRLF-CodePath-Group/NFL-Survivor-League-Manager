//
//  NewLeagueViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class NewLeagueViewController: UIViewController {
    @IBOutlet weak var newLeagueNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapCreate(_ sender: Any) {
        if !((self.newLeagueNameTextField.text?.isEmpty)!) {
            ParseAPIManager.createNewLeague((PFUser.current()?.username)!, self.newLeagueNameTextField.text!) { (league, error) in
                if let league = league {
                    print(league.owner)
                    (PFUser.current() as! User).addOwnedLeague(league.objectId!)
                    (PFUser.current() as! User).setValue((PFUser.current() as! User).ownedLeagues, forKey: User.ownedLeagueTag)
                    (PFUser.current() as! User).saveInBackground()
                    print((PFUser.current() as! User).ownedLeagues.count)
                    print("Created")
                
                    
                } else if let error = error {
                    print(error.localizedDescription)
                }
                
            }
    
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
