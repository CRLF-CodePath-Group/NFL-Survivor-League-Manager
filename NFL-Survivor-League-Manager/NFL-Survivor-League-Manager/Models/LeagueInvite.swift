//
//  LeagueInvite.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/4/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//
import Foundation
import Parse

class LeagueInvite: PFObject, PFSubclassing {
    static let fromOwnerTag = "fromOwnerTag"
    static let leagueId = "leagueIdTag"
    static let leagueNameTag = "leagueNameTag"
    static let userObjectIdsTag = "userObjectIdsTag"
    
    static func parseClassName() -> String {
        return "LeagueInvite"
    }
    
    @NSManaged var fromOwner : String
    @NSManaged var leagueId : String
    @NSManaged var leagueName : String
    @NSManaged var userObjectIds : [String]
    
    
    override init() {
        super.init()
    }
    
    
    func leagueInit(_ leagueId: String, _ leagueName: String, _ leagueOnwer: String, _ userObjects: [String]) {
        
        self.fromOwner = leagueOnwer
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.userObjectIds = userObjects
        self[LeagueInvite.leagueId] = self.leagueId
        self[LeagueInvite.leagueNameTag] = self.leagueName
        self[LeagueInvite.fromOwnerTag] = self.fromOwner
        self[LeagueInvite.userObjectIdsTag] = self.userObjectIds
        
    }
    func saveInfo() {
        self[LeagueInvite.leagueId] = self.leagueId
        self[LeagueInvite.leagueNameTag] = self.leagueName
        self[LeagueInvite.fromOwnerTag] = self.fromOwner
        self[LeagueInvite.userObjectIdsTag] = self.userObjectIds
    }
    func get() {
        self.leagueId = self[LeagueInvite.leagueId] as! String
        self.leagueName = self[LeagueInvite.leagueNameTag] as! String
        self.fromOwner = self[LeagueInvite.fromOwnerTag] as! String
        self.userObjectIds = self[LeagueInvite.userObjectIdsTag] as! [String] 
    }
}
