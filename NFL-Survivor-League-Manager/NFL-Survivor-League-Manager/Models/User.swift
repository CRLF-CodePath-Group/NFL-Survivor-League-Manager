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
    static let inviteTag = "inviteTag"
    @NSManaged var ownedLeagues : [String]
    @NSManaged var memberLeague : [String]
    @NSManaged var invites : [String]
  
    override init() {
        super.init()
    }
    func initUserInfo() {

        self[User.ownedLeagueTag] = ownedLeagues
        self[User.memberLeagueTag] = memberLeague
        self[User.inviteTag] = invites
    }
    func addOwnedLeague(_ leagueId: String) {
        ownedLeagues.append(leagueId)
    }
    func saveUserInfo() {
        self[User.ownedLeagueTag] = ownedLeagues
        self[User.memberLeagueTag] = memberLeague
        self[User.inviteTag] = invites
    }
}
