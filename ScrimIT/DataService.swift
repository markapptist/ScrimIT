//
//  DataService.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

// constants
let Challenges = "Challenges"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    // public instance
    
    static var instance: DataService {
        return _instance
    }
    
    var generalRef: FIRDatabaseReference?
    
    // MARK: - Database References
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    // MARK: - Storage Reference
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://scrimit-19652.appspot.com")
    }
    
    var challengeVideoStorageRef: FIRStorageReference {
        return mainStorageRef.child(Challenges)
    }
    
    // users reference
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
    var uploadProgress: UploadProgressDelegate?
    
    // Public Challenges
    
    // Challenges Ref
    
    var challengesRef: FIRDatabaseReference {
        return mainRef.child("Challenges")
    }
        
}
