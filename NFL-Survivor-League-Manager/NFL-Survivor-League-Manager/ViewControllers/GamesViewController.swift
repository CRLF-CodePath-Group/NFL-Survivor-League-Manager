//
//  GamesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by macstudent on 11/29/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UICollectionViewDataSource, GameCellDelegate
{
    var schedule : Schedule!
    var buttonState = Array(repeating: false, count: 32)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var awayTeamLogoImageView: UIImageView!
    @IBOutlet weak var homeTeamLogoImageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self

        NFLAPIManager.grabFullNFLSeason { (schedule, error) in
            if let schedule = schedule {
                self.schedule = schedule
                self.collectionView.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if schedule != nil {
            return schedule.games[0].count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        //let game = games[indexPath.item]
        cell.delegate = self
        cell.awayTeamLabel.text = schedule.games[0][indexPath.item].awayTeam.rawValue
        cell.homeTeamLabel.text = schedule.games[0][indexPath.item].homeTeam.rawValue
        let awayImage = UIImage(imageLiteralResourceName: "\(schedule.games[0][indexPath.row].awayTeam.rawValue)")
        let homeImage = UIImage(imageLiteralResourceName: "\(schedule.games[0][indexPath.row].homeTeam.rawValue)")
        cell.awayTeamLogoImageView.image = awayImage
        cell.homeTeamLogoImageView.image = homeImage
        cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        return cell
    }
    
    func updateRadios()
    {
        var n = 0
        let cell = GameCell()
        cell.delegate = self
        
        //sets all elements to false
        for index in 0 ..< buttonState.count
        {
            buttonState[index] = false
        }
        
        //Looks for any filled button and updates buttonState[] to true
        for cell in self.collectionView.visibleCells as! [GameCell]
        {
            let homePositions = (2*n)+1
            let awayPositions = 2*n
            
            if cell.awayTeamRadioButton.currentImage == #imageLiteral(resourceName: "Radio Button Fill.png")
            {
                buttonState[awayPositions] = true
            }
            else if cell.homeTeamRadioButon.currentImage == #imageLiteral(resourceName: "Radio Button Fill.png")
            {
                buttonState[homePositions] = true
            }
            
            n = n + 1
        }
        
        n = 0
        
        //This is what im trying to work on to limit picks to one team
        for cell in self.collectionView.visibleCells as! [GameCell]
        {
            let homePositions = (2*n)+1
            let awayPositions = 2*n
            
            if buttonState[awayPositions] == true
            {
                cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            }
            else if buttonState[homePositions] == true
            {
                cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            }
            else
            {
                cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
                cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
            }
            
            n = n + 1
        }
        
    }
    
    func didTapHomeButton(cell: GameCell)
    {
        let item = collectionView.indexPath(for: cell)?.item
        
        if cell.homeTeamRadioButon.currentImage == #imageLiteral(resourceName: "Radio Button.png")
        {
            cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        else
        {
            cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        
        updateRadios()
        print(buttonState)
    }
    
    func didTapAwayButton(cell: GameCell)
    {
        let item = collectionView.indexPath(for: cell)?.item
        
        if cell.awayTeamRadioButton.currentImage == #imageLiteral(resourceName: "Radio Button.png")
        {
            cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button Fill.png"), for: .normal)
            cell.homeTeamRadioButon.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        else
        {
            cell.awayTeamRadioButton.setImage(#imageLiteral(resourceName: "Radio Button.png"), for: .normal)
        }
        
        updateRadios()
        print(buttonState)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
