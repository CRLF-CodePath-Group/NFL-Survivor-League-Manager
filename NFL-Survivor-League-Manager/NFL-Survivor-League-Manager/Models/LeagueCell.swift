//
//  LeagueCell.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class LeagueCell: UITableViewCell {
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    var league : League! {
        didSet {
            self.leagueNameLabel.text = league.leagueName
            if league.owner == PFUser.current()?.username {
                rightImageView.image = #imageLiteral(resourceName: "5a2a0a4be80f86.7912727315127045879505.png")
            } else {
                rightImageView.image = nil
                leftImageView.image = nil
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
