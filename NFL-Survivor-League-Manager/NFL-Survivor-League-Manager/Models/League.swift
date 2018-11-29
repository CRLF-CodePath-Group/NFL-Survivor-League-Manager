//
//  League.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse
class League : PFObject{
    static let ownerTag = "ownerTag"
    static let leagueNameTag = "leagueNameTag"
    static let currentWeekTag = "currentWeekTag"
    static let aliveMembersTag = "aliveMembersTag"
    static let deadMembersTag = "deadMembersTag"
    static let hasStartedTag = "hasStartedTage"
    static let picksTag = "picksTag"
    
    @NSManaged var owner : String
    @NSManaged var leagueName : String
    @NSManaged var currentWeek : Int
    @NSManaged var aliveMembers : [String]
    @NSManaged var deadMembers : [String]
    @NSManaged var hasStarted : Bool
    @NSManaged var picks : [String : [String]]
    
    override init() {
        super.init()
    }
    
    func initLeague(_ leagueName: String, _ ownerName: String) {
        self[League.ownerTag] = ownerName
        self[League.leagueNameTag] = leagueName
        self[League.currentWeekTag] = currentWeek
        self[League.aliveMembersTag] = aliveMembers
        self[League.deadMembersTag] = deadMembers
        self[League.hasStartedTag] = hasStarted
        self[League.picksTag] = picks
    }
}
extension League : PFSubclassing {
    static func parseClassName() -> String {
        return "League"
    }
    
    
}
