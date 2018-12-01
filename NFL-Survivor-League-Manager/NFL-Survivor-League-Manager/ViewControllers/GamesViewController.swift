//
//  GamesViewController.swift
//  NFL-Survivor-League-Manager
//
//  Created by macstudent on 11/29/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UICollectionViewDataSource
{
    var games: [[String: Any]] = []
    var schedule : Schedule!
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
