//
//  Player.swift
//  ScrimIT
//
//  Created by Anthony Ma on 1/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    var email: String?
    var uid: String?
    var name: String?
    
    init(uid: String?, email: String?) {
        self.uid = uid
        self.email = email
    }
    
    
}
