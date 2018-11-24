//
//  ViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 10/19/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NFLAPIManager().grabFullNFLSeason { (gane, error) in
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

