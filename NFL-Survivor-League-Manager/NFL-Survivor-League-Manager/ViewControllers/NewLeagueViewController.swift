//
//  NewLeagueViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class NewLeagueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var newLeagueNameTextField: UITextField!
    
    @IBOutlet weak var userFoundLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userInviteTextField: UITextField!
    var toBeInvitedUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapInvite(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @IBAction func didTapCancel(_ sender: Any) {
        performSegue(withIdentifier: "toSurvivorHub", sender: nil)
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
        performSegue(withIdentifier: "toSurvivorHub", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.toBeInvitedUsers.count == 0 {
            return 1
        } else {
            return self.toBeInvitedUsers.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSurvivorHub" {
            usleep(200000)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableViews"), object: nil)
        }
    }
}
