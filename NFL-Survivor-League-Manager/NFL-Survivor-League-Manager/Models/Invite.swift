//
//  Invite.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class Invite: PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "Invite"
    }
    
    @NSManaged var fromOwner : String
    @NSManaged var leagueId : String
    @NSManaged var leagueName : String
    
    
    
}
