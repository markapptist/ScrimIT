//
//  DataService - CreatePlayer.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DataService {
    
    func createNewPlayer(uid: String, email: String) {
        
        let playerProfile: [String:Any] = ["email": email]
        
        DataService.instance.usersRef.child(uid).updateChildValues(playerProfile)
    }
    
}
