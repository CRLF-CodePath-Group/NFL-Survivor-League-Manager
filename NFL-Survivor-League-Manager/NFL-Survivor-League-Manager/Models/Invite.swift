//
//  Invite.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 12/4/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class Invite : PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "Invite"
    }

    
    @NSManaged var leagueName: String
    @NSManaged var leagueID : String
    @NSManaged var leagueOwner : String
    
    
    override init() {
        super.init()
    }
    
    func inviteInit(_ leagueName: String, _ leagueID: String, _ leagueOwner: String) {
   
        self.leagueOwner = leagueOwner
        self.leagueName = leagueName
        self.leagueID = leagueID

    }

    
    
}
