//
//  DataService - Save.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

extension DataService {
    
    func saveChallengeVideo(file: URL, name: String, videoName: String) {
        let uniqueID = NSUUID().uuidString
        
        self.uploadProgress?.showActivityView()
        
        // Storage
        self.challengeVideoStorageRef.child(uniqueID).putFile(file, metadata: nil) { (meta, error) in
            
            print("started")
            if error != nil {
                // print(error?.localizedDescription ?? "")
                self.uploadProgress?.errorUploading(error: error!)
            }
            else {
                let profile: [String:Any] = ["title": name, "URL": meta!.downloadURL()!.absoluteString]
                
                // public list
                self.challengesRef.child(uniqueID).setValue(profile)
                
                self.uploadProgress?.removeActivityView()
                print("done")
            }
            self.uploadProgress?.removeActivityView()
        }
        
        /*
        let metadata = FIRStorageMetadata()
        metadata.contentType = "mov/mp4"
        
        let uploadTask = self.challengeVideoStorageRef.child(uniqueID).putFile(file, metadata: metadata)
        self.uploadProgress?.showActivityView()
        
        // failure case
        uploadTask.observe(.failure) { (snapshot) in
            self.uploadProgress?.errorUploading()
        }
        
        // progress case
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress) // do something with progress
        }
        
        // success case
        uploadTask.observe(.success) { (snapshot) in
            self.uploadProgress?.removeActivityView()
            let profile: [String:Any] = ["title": name, "fileURL": metadata.storageReference]
            
            self.challengesRef.child(uniqueID).setValue(profile)
            uploadTask.removeAllObservers()
        }
        */
    }
    
    func saveResponseToChallenge(name: String, videoName: String, file: URL, videoID: String) {
        let uniqueID = NSUUID().uuidString

        self.uploadProgress?.showActivityView()
        
        // Storage
        self.challengeVideoStorageRef.child(uniqueID).putFile(file, metadata: nil) { (meta, error) in
            if error != nil {
                // print(error?.localizedDescription ?? "")
                self.uploadProgress?.errorUploading(error: error!)
            }
            else {
                let profile: [String:Any] = ["title": name, "URL": meta!.downloadURL()!.absoluteString]
                
                // public list
                self.challengesRef.child(videoID).child("responses").child(uniqueID).setValue(profile)
                
                self.uploadProgress?.removeActivityView()
            }
        }
        
        /*
        let uploadTask = self.challengeVideoStorageRef.putFile(file, metadata: nil)
        self.uploadProgress?.showActivityView()
        
        // failure case
        uploadTask.observe(.failure) { (snapshot) in
            self.uploadProgress?.errorUploading()
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress)
        }
        
        uploadTask.observe(.success) { (snapshot) in
            self.uploadProgress?.removeActivityView()
            self.challengesRef.child(uniqueID).child(name).child("responses").child(uniqueID).setValue(file.absoluteString)
            uploadTask.removeAllObservers()
        }
        */
    }
    
}
