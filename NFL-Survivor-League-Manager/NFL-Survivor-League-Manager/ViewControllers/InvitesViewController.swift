//
//  InvitesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class InvitesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var inviteList = [Invite]()
    @IBOutlet weak var listViewer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewer.delegate = self
        listViewer.dataSource = self
        listViewer.rowHeight = 120
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = listViewer.dequeueReusableCell(withIdentifier: "InviteCell", for: indexPath) as! InviteCell
        //cell.listVariable = inviteList[indexPath.row]
        return cell
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
