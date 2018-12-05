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
    
    init(_ leagueId: String, _ leagueName: String, _ leagueOnwer: String, _ userObjects: [String]) {
        super.init()
        
        self.fromOwner = leagueOnwer
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.userObjectIds = userObjects
    }


}
