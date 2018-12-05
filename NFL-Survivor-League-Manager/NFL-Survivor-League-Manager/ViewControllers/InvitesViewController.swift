//
//  InvitesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class InvitesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, InviteCellDelegate {
    func removeCell(_ indexPath: IndexPath) {
        print("hehesjdklsjlkdjklsldjldjkl")
        self.leagues.remove(at: indexPath.row)
        self.listViewer.reloadData()
        print(leagues.count)
    }
    

    

    var leagues = [League]()
    @IBOutlet weak var listViewer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "reloadInviteTable"), object: nil)
        listViewer.delegate = self
        listViewer.dataSource = self
        self.updateInvites()
        self.fetchLeagues()
        self.listViewer.reloadData()
        
        // Do any additional setup after loading the view.
    }
    @objc func reloadData() {
        
        self.listViewer.reloadData()
    }
    func updateInvites() {
        ParseAPIManager.fetchInvitesForUser { (success) in
            if success! {
                self.listViewer.reloadData()
            } else {
                print("Huh?")
            }
        }
    }
    func fetchLeagues() {
        let user = PFUser.current() as! User
        ParseAPIManager.getLeagueById(user.invites) { (leagues, error) in
            if let leagues = leagues {
                self.leagues = leagues
                self.listViewer.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.leagues.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if leagues.count > 0 {
            let cell = listViewer.dequeueReusableCell(withIdentifier: "LeagueInviteCell", for: indexPath) as! InviteCell
            
            let owner = leagues[indexPath.row].owner
            let leagueName = leagues[indexPath.row].leagueName
            cell.leagueInviteInfoLabel.text = "\(owner) is inviting you to join: \(leagueName)"
            cell.league = leagues[indexPath.row]
            cell.indexPath = indexPath
            cell.delegate = self
            return cell
        } else {
            return UITableViewCell()
        }
    }


}
