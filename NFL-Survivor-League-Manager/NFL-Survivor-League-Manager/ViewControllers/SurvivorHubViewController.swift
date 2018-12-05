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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.leagueTableView.delegate = self
        self.leagueTableView.dataSource = self
        getUserLeagues()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "reloadTableViews"), object: nil)
        ParseAPIManager.fetchInvitesForUser { (success) in
            if success! {
                print("loaded")
                
            } else {
                print("fail")
            }
        }
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
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.lightGray
            } else {
                cell.backgroundColor = UIColor.lightText
            }
            cell.leagueNameLabel.text = self.leagues[indexPath.row].leagueName
            
        
            return cell
        }
        return UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOwnedLeagueView" {
            
        }
        if segue.identifier == "toInvites" {
            print("test")
            ParseAPIManager.fetchInvitesForUser { (success) in
                if success! {
                    usleep(400000)
                    print("loaded")
                    
                } else {
                    print("fail")
                }
            }
        }
    }
}
