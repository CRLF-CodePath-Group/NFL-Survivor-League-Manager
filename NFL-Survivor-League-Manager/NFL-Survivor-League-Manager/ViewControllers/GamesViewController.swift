//
//  GamesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by macstudent on 11/29/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class GamesViewController: UIViewController, UICollectionViewDataSource, GameCellDelegate {
    var buttonState = [Bool]()
    var league = League()
    var currentWeekDisplayed = 0
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var weekNumLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetAllButtons()
        
        // Do any additional setup after loading the view.
        collectionView.dataSource = self

        
        self.currentWeekDisplayed = self.league.currentWeek - 1
        
        if self.currentWeekDisplayed == 0 {
            self.previousButton.isHidden = true
        }
        if self.currentWeekDisplayed == 16 {
            self.nextButton.isHidden = true
        }
        self.title = self.league.leagueName
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if NFLSchedule != nil {
            return NFLSchedule.games[self.currentWeekDisplayed].count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.delegate = self
        cell.awayTeamLabel.text = NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].awayTeam.rawValue
        cell.homeTeamLabel.text = NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].homeTeam.rawValue
        let awayImage = UIImage(imageLiteralResourceName: "\(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].awayTeam.rawValue)")
        let homeImage = UIImage(imageLiteralResourceName: "\(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].homeTeam.rawValue)")
        cell.cellNumber = indexPath.row
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.awayTeamLogoImageView.image = awayImage
        cell.homeTeamLogoImageView.image = homeImage
        cell.league = self.league
        let odd = (cell.cellNumber! * 2) + 1
        let even = (cell.cellNumber! * 2)
        if league.didUserPick(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].awayTeam, self.currentWeekDisplayed) {
            cell.awayTeamRadioButton.isHidden = true
        } else {
            if ((even % 2 == 0 && self.buttonState[even] == true) || league.didPickForSpecificWeek(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].awayTeam, self.currentWeekDisplayed)) {
                cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
                cell.awayTeamRadioButton.isHidden = false
            } else {
                cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
                cell.awayTeamRadioButton.isHidden = false
            }
        }
        if league.didUserPick(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].homeTeam, self.currentWeekDisplayed) {
            cell.homeTeamRadioButon.isHidden = true
        } else {
            if ((odd % 2 == 1 && self.buttonState[odd] == true) || league.didPickForSpecificWeek(NFLSchedule.games[self.currentWeekDisplayed][indexPath.row].homeTeam, self.currentWeekDisplayed)) {
                cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
                cell.homeTeamRadioButon.isHidden = false
            } else {
                cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
                cell.homeTeamRadioButon.isHidden = false
            }
        }


        return cell
    }
    
    func updateRadios(_ num: Int, _ isHomeTeam: Bool, _ team: Team) {

        for i in 0...self.buttonState.count-1 {
            if i != num  && self.buttonState[i] == true {
                self.buttonState[i] = false
                
                var cellIdNum = Int()
                var isHomeTeam = Bool()
                if i % 2 == 0 {
                    cellIdNum = i/2
                    isHomeTeam = false
                } else {
                    cellIdNum = (i-1)/2
                    isHomeTeam = true
                }
                for cell in collectionView.visibleCells as! [GameCell] {
                    if cell.cellNumber! == cellIdNum{
                        if isHomeTeam {
                            //league.addUserPick(team, self.currentWeekDisplayed)
                            cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
                        }else {
                            //league.addUserPick(team, self.currentWeekDisplayed)

                            cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
                        }
                    }
                }
            }
        }
        
        self.buttonState[num] = true
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let screenSize = UIScreen.main.bounds
        
        layout.itemSize = CGSize(width:screenSize.width/2 , height:89)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.layer.borderColor = UIColor.white.cgColor
        collectionView.layer.borderWidth = 1
        collectionView!.collectionViewLayout = layout
        collectionView.reloadData()
    }
    @IBAction func didTapPrevious(_ sender: Any) {
        league.addUserPick(self.getTeamThatWasPicked(), self.currentWeekDisplayed)
        if self.currentWeekDisplayed > 0 {
            self.currentWeekDisplayed -= 1
            self.resetAllButtons()
            if self.currentWeekDisplayed == 0 {
                self.previousButton.isHidden = true
                
            }
        }
        if self.currentWeekDisplayed < 16 {
            self.nextButton.isHidden = false
        }
        self.collectionView.reloadData()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        league.addUserPick(self.getTeamThatWasPicked(), self.currentWeekDisplayed)
        if self.currentWeekDisplayed < 16 {
            self.currentWeekDisplayed += 1
            self.resetAllButtons()
            if self.currentWeekDisplayed == 16 {
                self.nextButton.isHidden = true
            }
        }
        if self.currentWeekDisplayed > 0 {
            self.previousButton.isHidden = false
        }
        self.collectionView.reloadData()
    }
    func getTeamThatWasPicked() -> Team {
        for i in 0...self.buttonState.count-1 {
            if self.buttonState[i] == true {
                if i % 2 == 0 {
                    return NFLSchedule.games[self.currentWeekDisplayed][i/2].awayTeam
                } else {
                    return NFLSchedule.games[self.currentWeekDisplayed][(i-1)/2].homeTeam
                }
            }
        }
        return Team.NIL
    }
    func getCurrentWeekDisplayed() -> Int {
        return self.currentWeekDisplayed
    }
    @IBAction func didTapBack(_ sender: Any) {
        if self.league.owner == PFUser.current()?.username {
            performSegue(withIdentifier: "fromPicksToOwnerManage", sender: nil)
        } else {
            performSegue(withIdentifier: "fromPicksToHub", sender: nil)
        }
    }
    func resetAllButtons() {
        self.buttonState = [Bool]()
        for _ in 0...31 {
            self.buttonState.append(false)
        }
    }
    func setCellProperties(_ cell: GameCell, _ indexPathRow: Int) -> GameCell {

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromPicksToOwnerManage" {
            let dest = segue.destination as! UINavigationController
            let vc = dest.topViewController as! OwnerDetailsViewController
            vc.league = self.league
        } else if segue.identifier == "fromPicksToHub" {
            
        }
    }
    
}
