//
//  InviteCell.swift
//  NFL-Survivor-League-Manager
//
//  Created by Tu Pham on 11/30/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class InviteCell: UITableViewCell {

    @IBOutlet weak var leagueInviteInfoLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTapAccept(_ sender: Any) {
    }
    
    @IBAction func didTapDecline(_ sender: Any) {
    }
    
}
