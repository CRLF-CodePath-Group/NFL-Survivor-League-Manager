//
//  Game.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/23/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation

class Game {
    var id: Int
    var awayTeam: Team
    var homeTeam: Team
    var wasPlayed: Bool
    var week: Int
    var awayScore: Int
    var homeScore: Int
    
    init(_ game: [String :Any]) {
        let scheduleTag = game["schedule"] as! [String : Any]
        let scoreTag = game["score"] as? [String : Any]
        let homeTeamDictionary = scheduleTag["homeTeam"] as! [String :Any]
        let awayTeamDictionary = scheduleTag["awayTeam"] as! [String :Any]
        let homeTeamAbb = homeTeamDictionary["abbreviation"] as! String
        let awayTeamAbb = awayTeamDictionary["abbreviation"] as! String
        let status = scheduleTag["playedStatus"] as! String
        if status == "COMPLETED" {
            self.wasPlayed = true
            self.homeScore = scoreTag!["homeScoreTotal"] as! Int
            self.awayScore = scoreTag!["awayScoreTotal"] as! Int
        } else {
            self.wasPlayed = false
            self.homeScore = -1
            self.awayScore = -1
        }
        self.id = scheduleTag["id"] as! Int
        self.week = scheduleTag["week"] as! Int
        self.awayTeam = Team.getTeamByAbbreviation(awayTeamAbb)
        self.homeTeam = Team.getTeamByAbbreviation(homeTeamAbb)
    }
    
    func winner() -> Team {
        if(self.awayScore == -1 && self.homeScore == -1) {
            return Team.NIL
        } else if (self.awayScore > self.homeScore) {
            return self.awayTeam
        } else if (self.homeScore > self.awayScore) {
            return self.homeTeam
        } else { //Tie case
            return Team.NIL
        }
    }
    func print() {
        Swift.print(self.id)
        Swift.print(self.awayTeam.rawValue)
        Swift.print(self.homeTeam.rawValue)
        Swift.print(self.wasPlayed)
        
    }
}
