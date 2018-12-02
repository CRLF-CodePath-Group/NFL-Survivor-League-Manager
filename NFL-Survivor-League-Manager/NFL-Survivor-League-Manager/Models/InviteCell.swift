//
//  InviteCell.swift
//  NFL-Survivor-League-Manager
//
//  Created by Tu Pham on 11/30/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class InviteCell: UITableViewCell {

    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var LeagueName: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var declineButton: UIButton!
    var listVariable: Invite!{
        didSet{
            //add later.
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didAccept(_ sender: Any) {
    }
    
    @IBAction func didDecline(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
