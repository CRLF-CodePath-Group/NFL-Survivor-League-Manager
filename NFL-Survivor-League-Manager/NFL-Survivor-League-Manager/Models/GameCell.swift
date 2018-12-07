//
//  GameCell.swift
//  NFL-Survivor-League-Manager
//
//  Created by macstudent on 11/29/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
protocol  GameCellDelegate : class {
    func updateRadios(_ num: Int, _ isHomeTeam: Bool, _ teamPicked: Team)
    func getCurrentWeekDisplayed() -> Int
}

class GameCell: UICollectionViewCell {
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamRadioButton: UIButton!
    @IBOutlet weak var homeTeamRadioButon: UIButton!
    
    weak var delegate : GameCellDelegate?
    var cellNumber : Int?
    var indexPath : IndexPath?
    var league = League()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        self.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        
    }
    @IBAction func didTapAwayRadioButton(_ sender: UIButton) {
        
        if awayTeamRadioButton.currentImage == #imageLiteral(resourceName: "Radio Button.png") {
            awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            let cellIdNum = 2 * self.cellNumber!
            let team = Team.getTeamByName(self.awayTeamLabel.text!)
            league.addUserPick(team, (delegate?.getCurrentWeekDisplayed())!)
            self.delegate?.updateRadios(cellIdNum, false, Team.getTeamByName(awayTeamLabel.text!))
        }
    }
    
    @IBAction func didTapHomeRadioButton(_ sender: UIButton) {
        if homeTeamRadioButon.currentImage == #imageLiteral(resourceName: "Radio Button.png") {
            homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            let cellIdNum = (2 * self.cellNumber!) + 1
            let team = Team.getTeamByName(self.homeTeamLabel.text!)
            league.addUserPick(team, (delegate?.getCurrentWeekDisplayed())!)
            self.delegate?.updateRadios(cellIdNum, true, Team.getTeamByName((homeTeamLabel.text)!))
        }
    }

}
