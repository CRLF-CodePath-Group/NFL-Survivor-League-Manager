//
//  User.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/25/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class User : PFUser{
    static let weekParseUserTag = "week"
    static let weekCount = 17
    static let ownedLeagueTag = "ownedLeagueTag"
    static let memberLeagueTag = "memberLeagueTag"
    var ownedLeagues = [League]()
    var memberLeague = [League]()
    
    override init() {
            super.init()

    }
    func initUserInfo() {

        self[User.ownedLeagueTag] = ownedLeagues
        self[User.memberLeagueTag] = memberLeague
    }

}
