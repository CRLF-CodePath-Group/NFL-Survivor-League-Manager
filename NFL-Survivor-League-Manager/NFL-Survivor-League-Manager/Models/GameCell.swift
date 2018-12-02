//
//  GameCell.swift
//  NFL-Survivor-League-Manager
//
//  Created by macstudent on 11/29/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

protocol  GameCellDelegate : class
{
    func updateRadios(_ cell: GameCell, _ homeRadioButton: UIImage?, _ awayRadioButton: UIImage?)
}

class GameCell: UICollectionViewCell
{
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    @IBOutlet weak var awayTeamRadioButton: UIButton!
    @IBOutlet weak var homeTeamRadioButon: UIButton!
    
    weak var delegate : GameCellDelegate?
    var cellNumber = 0
    
    @IBAction func didTapAwayRadioButton(_ sender: UIButton)
    {
        if awayTeamRadioButton.currentImage == #imageLiteral(resourceName: "Radio Button.png")
        {
            awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        else
        {
            awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
    }
    
    @IBAction func didTapHomeRadioButton(_ sender: UIButton)
    {
        if homeTeamRadioButon.currentImage == #imageLiteral(resourceName: "Radio Button.png")
        {
            homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        else
        {
            homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
    }
    
}
