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

    
    var userOwnedLeagues = [League]()
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var ownedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ownedTableView.dataSource = self
        ownedTableView.delegate = self
        getUserLeagues()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "reloadTableViews"), object: nil)
        // Do any additional setup after loading the view.
    }
    func getUserLeagues() {
        let user = PFUser.current() as! User
        ParseAPIManager.getLeagueById(user.ownedLeagues) { (leagues, error) in
            if let leagues = leagues {
                self.userOwnedLeagues = leagues
                self.ownedTableView.reloadData()
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
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.ownedTableView {
            
            return self.userOwnedLeagues.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.ownedTableView && self.userOwnedLeagues.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ownedTableCell") as! OwnedLeagueCell
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.lightGray
            } else {
                cell.backgroundColor = UIColor.lightText
            }
            cell.leagueNameLabel.text = self.userOwnedLeagues[indexPath.row].leagueName
            
        
            return cell
        }
        return UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOwnedLeagueView" {
            
        }
    }
}
