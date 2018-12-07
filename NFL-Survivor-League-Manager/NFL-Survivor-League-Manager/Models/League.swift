//
//  League.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse
class League : PFObject, PFSubclassing{

    
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
    init(_ leagueName: String, _ ownerName: String) {
        super.init()
        self.owner = ownerName
        self.leagueName = leagueName
        self.currentWeek = 1
        self.aliveMembers = [String]()
        self.deadMembers = [String]()
        self.picks = [String : [String]]()
        self.hasStarted = false
    }
    
    func addAliveMember(_ memmberId: String) {
        var doesContain = false
        for s in self.aliveMembers {
            if s == memmberId {
                doesContain = true
                break
            }
        }
        if !doesContain {
            self.aliveMembers.append(memmberId)
            self.picks[memmberId] = [String]()
            for _ in 0...16 {
                self.picks[memmberId]?.append(Team.NIL.rawValue)
            }
        }
        self.saveInBackground()
    }
    func didUserPick(_ team: Team, _ current: Int) -> Bool{
        let pick = self.picks[(PFUser.current()?.objectId)!]
        if team == Team.NIL {
            return false
        }
        for i in 0...(pick?.count)!-1 {
            if pick![i] == team.rawValue && i != current {
                return true
            }
        }
        return false
    }
    func didPickForSpecificWeek(_ team: Team, _ current: Int) -> Bool {
        let pick = self.picks[(PFUser.current()?.objectId)!]!
        if pick[current] == team.rawValue {
            return true
        }
        return false
        
    }
    func addUserPick(_ team: Team, _ current: Int) {
        let userId = PFUser.current()?.objectId
        var pick = self.picks[userId!]!
        if team != Team.NIL {
            pick[current] = team.rawValue
            self.picks[userId!]! = pick
        }
        self.saveInBackground()
    }
    static func parseClassName() -> String {
        return "League"
    }

}

