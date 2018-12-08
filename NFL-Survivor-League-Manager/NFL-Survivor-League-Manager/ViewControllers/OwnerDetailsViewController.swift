//
//  OwnerDetailsViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/4/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class OwnerDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var leagueMembers = [User]()
    var league = League() {
        didSet {
            self.title = league.leagueName
            
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentWeekNumLabel: UILabel!
    @IBOutlet weak var playersLeftNumLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = league.leagueName
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.currentWeekNumLabel.text = "\(self.league.currentWeek)"
        self.playersLeftNumLabel.text = "\(self.league.aliveMembers.count)"
        ParseAPIManager.fetchMultipleUsersByObjectId(self.league.aliveMembers + self.league.deadMembers) { (users, error) in
            if let users = users {
                self.leagueMembers = users
                self.tableView.reloadData()
            }
        }
        ParseAPIManager.getLeagueById([self.league.objectId!]) { (leagues, error) in
            if let leagues = leagues {
                self.league = leagues[0]
                usleep(400000)
                self.currentWeekNumLabel.text = "\(self.league.currentWeek)"
                self.playersLeftNumLabel.text = "\(self.league.aliveMembers.count)"
                self.league.saveInBackground()
                self.tableView.reloadData()
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapMakeMyPick(_ sender: Any) {
        performSegue(withIdentifier: "makeMyPickSegue", sender: nil)
    }

    @IBAction func didTapGoBackToHUb(_ sender: Any) {
        performSegue(withIdentifier: "backToHubSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "makeMyPickSegue" {
            let destination = segue.destination as! UINavigationController
            let vc = destination.topViewController as! GamesViewController
            vc.league = self.league
        }
    }
    
    @IBAction func didTapAdvanceWeek(_ sender: Any) {
        ParseAPIManager.getLeagueById([self.league.objectId!]) { (leagues, error) in
            if let leagues = leagues {
                self.league = leagues[0]
                self.league.moveWeekForward()
                usleep(400000)
                self.currentWeekNumLabel.text = "\(self.league.currentWeek)"
                self.playersLeftNumLabel.text = "\(self.league.aliveMembers.count)"
                self.league.saveInBackground()
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlayerInfoCell", for: indexPath) as! PlayerInfoCell
        cell.playerNameLabel.text = self.leagueMembers[indexPath.row].username
        if self.league.isUserAlive(self.leagueMembers[indexPath.row].objectId!) {
            cell.playerStatusLabel.text = "Status: Alive"
        } else {
            cell.playerStatusLabel.text = "Status: Dead"
        }
        return cell
    }
    func updateLeague() {

    }
}
