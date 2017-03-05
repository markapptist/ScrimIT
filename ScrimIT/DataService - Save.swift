//
//  DataService - Save.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DataService {
    
    func saveChallengeVideo(file: URL, title: String, user: String, userEmail: String, videoName: String) {
        
        // Storage
        self.challengeVideoStorageRef.child(videoName).putFile(file, metadata: nil) { (meta, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
            else {
                let profile: [String:Any] = ["postedBy": userEmail, "URL": meta!.downloadURL()!.absoluteString]
             
                // public list
                self.challengesRef.child(title).setValue(profile)
                
                // user posted list
                self.usersRef.child(user).child("PostedChallenges").child(title).setValue(profile)
                
                print("done")
            }
        }
    }
    
    func saveResponseToChallenge(name: String, userEmail: String, videoName: String, file: URL) {
        self.challengeVideoStorageRef.child(videoName).putFile(file, metadata: nil) { (meta, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
            else {
                let profile: [String:Any] = ["respondedBy": userEmail, "URL": meta!.downloadURL()!.absoluteString]
                
                self.challengesRef.child(name).child("responses").child("1").setValue(profile)
                
                print("done")
            }
        }
    }
    
}
