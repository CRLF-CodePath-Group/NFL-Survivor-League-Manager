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
    static let leaguesTag = "leaguesTag"
    static let inviteTag = "inviteTag"
    @NSManaged var leagues : [String]
    @NSManaged var memberLeague : [String]
    @NSManaged var invites : [String]
  
    override init() {
        super.init()
        
        
    }
    func initUserInfo() {
        self.invites = self[User.inviteTag] as! [String]
        self.leagues = self[User.leaguesTag] as! [String]
        
        self[User.leaguesTag] = leagues
        self[User.inviteTag] = invites
    }
    func addLeague(_ leagueId: String) {
        var doesContain = false
        for s in self.leagues {
            if s == leagueId {
                doesContain = true
            }
        }
        if !doesContain {
            leagues.append(leagueId)
        }
    }
    func saveUserInfo() {
        self[User.leaguesTag] = self.leagues
        self[User.inviteTag] = invites
    }
    func addInivite(_ invite: String) {
        var doesContain = false
        for s in self.invites {
            if s == invite {
                doesContain = true
            }
        }
        if !doesContain {
            self.invites.append(invite)
        }
        self.saveUserInfo()
    }
    func removeInvite(_ invite: String) {
        if self.invites.count > 0 {
            var index = -1
            for i in 0...self.invites.count-1 {
                if self.invites[i] == invite {
                    index = i
                    break
                }
            }
            if index != -1 {
                self.invites.remove(at: index)
                self.saveUserInfo()
                self.saveInBackground()
            }
        }
    }
}
