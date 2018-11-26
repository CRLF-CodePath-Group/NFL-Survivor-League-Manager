//
//  Schedule.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/23/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation



class Schedule {
    static var games = [[Game]]()
    init(_ gameDictionaryArray: [[String: Any]]) {
        for _ in 0...16 {
            let test = [Game]()
            Schedule.games.append(test)
        }
        for gameDictionary in gameDictionaryArray {
           let game = Game(gameDictionary)
           Schedule.games[game.week-1].append(game)
        }
    }
}
