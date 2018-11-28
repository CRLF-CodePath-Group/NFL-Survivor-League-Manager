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
    static let currentWeekTag = "currentWeekTag"
    static let aliveMembersTag = "aliveMembersTag"
    static let deadMembersTag = "deadMembersTag"
    static let hasStartedTag = "hasStartedTage"
    static let picksTag = "picksTag"
    
    var owner = String()
    var currentWeek = Int()
    var aliveMembers = [String]()
    var deadMembers = [String]()
    var hasStarted = Bool()
    var picks = [[Pick]]()
    
    override init() {
        super.init()
    }
    
    func initLeague() {
        for _ in 1...17 {
            let pick = [Pick]()
            picks.append(pick)
        }
        self[League.ownerTag] = owner
        self[League.currentWeekTag] = currentWeek
        self[League.aliveMembersTag] = aliveMembers
        self[League.deadMembersTag] = deadMembers
        self[League.hasStartedTag] = hasStarted
        self[League.picksTag] = picks
    }
}
