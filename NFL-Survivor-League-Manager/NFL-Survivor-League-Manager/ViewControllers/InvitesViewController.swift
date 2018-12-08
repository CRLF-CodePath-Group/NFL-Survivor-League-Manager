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
        self.leagues.remove(at: indexPath.row)
        self.listViewer.deleteRows(at: [indexPath], with: .fade)
        self.listViewer.reloadData()
    }
    

    

    var leagues = [League]()
    @IBOutlet weak var listViewer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewer.delegate = self
        listViewer.dataSource = self
        listViewer.layer.borderWidth = 2
        listViewer.layer.borderColor = UIColor.white.cgColor

        self.updateInvites()
        self.fetchLeagues()
        self.listViewer.reloadData()
        
        // Do any additional setup after loading the view.
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
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else {
            return UITableViewCell()
        }
    }


}
