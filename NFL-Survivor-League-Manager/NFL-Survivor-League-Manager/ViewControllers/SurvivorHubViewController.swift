//
//  SurvivorHubViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class SurvivorHubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var leagueTableView: UITableView!
    var leagues = [League]()
    var leagueToSend = League()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leagueTableView.delegate = self
        self.leagueTableView.dataSource = self
        getUserLeagues()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "reloadTableViews"), object: nil)
        //ParseAPIManager.fetchInvitesForUser { (success) in
   
        //}
        self.leagueTableView.layer.borderColor = UIColor.white.cgColor
        self.leagueTableView.layer.borderWidth = 2
        // Do any additional setup after loading the view.
    }
    func getUserLeagues() {
        let user = PFUser.current() as! User
        ParseAPIManager.getLeagueById(user.leagues) { (leagues, error) in
            if let leagues = leagues {
                self.leagues = leagues
                self.leagueTableView.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    @objc func reloadData() {
        
        self.getUserLeagues()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapNewLeague(_ sender: Any) {
        performSegue(withIdentifier: "toNewLeagueController", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getUserLeagues()
        
    }
    @IBAction func didTapLogOut(_ sender: Any) {
        PFUser.logOut()
        let login = storyboard?.instantiateViewController(withIdentifier: "LogInViewController")
        self.present(login!, animated: true, completion: nil)
    }
    
  
    
    @IBAction func didTapInvites(_ sender: Any) {
        
        performSegue(withIdentifier: "toInvites", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.leagues.count > 0 {
            return self.leagues.count
        } else {
            return 0;
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.leagues.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell") as! LeagueCell
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.selectionStyle = .none
            cell.league = self.leagues[indexPath.row]
            
        
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if self.leagues[indexPath.row].owner == PFUser.current()?.username {
            self.leagueToSend = self.leagues[indexPath.row]
            performSegue(withIdentifier: "toOwnedLeagueView", sender: nil)
        } else {
            self.leagueToSend = self.leagues[indexPath.row]
            performSegue(withIdentifier: "toGamePickerView", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOwnedLeagueView" {
            let destination = segue.destination as! UINavigationController
            let vc = destination.topViewController as! OwnerDetailsViewController
            vc.league = self.leagueToSend
        }
        if segue.identifier == "toGamePickerView" {
            let destination = segue.destination as! UINavigationController
            let vc = destination.topViewController as! GamesViewController
            vc.league = self.leagueToSend
        }
        if segue.identifier == "toInvites" {
            print("test")
            ParseAPIManager.fetchInvitesForUser { (success) in
                if success! {
                    usleep(400000)
                    //print("loaded")
                    
                } else {
                    print("fail")
                }
            }
        }
    }
}
