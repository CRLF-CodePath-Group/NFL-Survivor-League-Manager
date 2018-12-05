//
//  InvitesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class InvitesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listViewer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewer.delegate = self
        listViewer.dataSource = self
        ParseAPIManager.fetchInvitesForUser { (success) in
            if success! {
                
                self.listViewer.reloadData()
            } else {
                print("Huh?")
            }
        }
        self.listViewer.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (PFUser.current() as! User).invites.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = listViewer.dequeueReusableCell(withIdentifier: "LeagueInviteCell", for: indexPath) as! InviteCell
        let user = PFUser.current() as! User
        cell.leagueInviteInfoLabel.text = "test"
        return cell
    }


}
