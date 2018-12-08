//
//  SecondLaunchScreenViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/6/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class SecondLaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NFLAPIManager.grabFullNFLSeason { (schedule, error) in
            if let schedule = schedule {
                NFLSchedule = schedule
                self.performSegue(withIdentifier: "toMainPage", sender: nil)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
