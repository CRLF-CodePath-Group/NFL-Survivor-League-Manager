//
//  OwnerDetailsViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/4/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class OwnerDetailsViewController: UIViewController {
    var league = League()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = league.leagueName
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
    

}
