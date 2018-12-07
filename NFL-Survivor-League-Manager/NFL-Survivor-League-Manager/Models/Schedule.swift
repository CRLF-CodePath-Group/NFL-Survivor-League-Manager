//
//  Schedule.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/23/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import  UIKit


class Schedule {
    var games = [[Game]]()
    init() {
        self.games = [[Game]]()
    }
    init(_ gameDictionaryArray: [[String: Any]]) {
        for _ in 0...16 {
            let test = [Game]()
            games.append(test)
        }
        for gameDictionary in gameDictionaryArray {
           let game = Game(gameDictionary)
           games[game.week-1].append(game)
        }
    }
}

