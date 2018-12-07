//
//  Pick.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/28/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse
class Pick: PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "Pick"
    }
    
    @NSManaged var username : String
    @NSManaged var teamPicked : String
    override init() {
        super.init()
    }
    
    init(_ username: String, _ teamPicked: String) {
        super.init()
        self.username = username
        self.teamPicked = teamPicked

    }
}
