//
//  HomeFeedVC - Data.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension HomeFeedVC {
    
    // get challenges from public list
    func getPublicChallenges() {
        self.showActivityIndicator()
        
        self.ref?.observe(.value, with: { (snapshot) in
            
            for challenge in snapshot.children.allObjects {
                
                let challengeProfile = challenge as! FIRDataSnapshot
                let challengeData = challengeProfile.value as? NSDictionary
                
                let challengeName = challengeProfile.key
                let videoURLString = challengeData?["URL"] as? String
//                let postedBy = challengeData?["postedBy"] as? String
                
                let video = ChallengeVideo(url: videoURLString, title: challengeName)
                
                self.videos.append(video)
                
                if snapshot.childSnapshot(forPath: challengeName).hasChild("responses") {
                    
                    var responsesArray: [ChallengeVideo] = []
                    
                    for response in snapshot.childSnapshot(forPath: challengeName).childSnapshot(forPath: "responses").children.allObjects {
                        
                        let responseProfile = response as! FIRDataSnapshot
                        let responseData = responseProfile.value as? NSDictionary
                        
                        let responseVideoURLString = responseProfile.key
                        let responseUserEmail = responseData?["respondedBy"] as? String
                        
                        let responseVideo = ChallengeVideo(url: responseVideoURLString, title: responseUserEmail)
                        
                        responsesArray.append(responseVideo)
                    }
                    
                    self.responses.updateValue(responsesArray, forKey: challengeName)
                }
                else {
                    
                    self.responses.updateValue([], forKey: challengeName)
                }
            }
            
            self.tableView?.reloadData()
            self.hideActivityIndicator()
            
        }, withCancel: { (error) in
            self.displayNoChallenges()
            self.hideActivityIndicator()    
        })
    }
    
    
}
