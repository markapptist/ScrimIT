//
//  HomeFeedVC - Data.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension HomeFeedCollectionVC {
    
    // get challenges from public list
    func getPublicChallenges() {
        self.showActivityIndicator()
        
        self.ref.observe(.value, with: { (snapshot) in
            self.videos = []
            
            for challenge in snapshot.children.allObjects {
                
                let challengeProfile = challenge as! FIRDataSnapshot
                let challengeData = challengeProfile.value as? NSDictionary
                
                let videoUniqueID = challengeProfile.key
                let videoTitleName = challengeData?["title"] as? String
                let videoURLString = challengeData?["URL"] as? String
//                let postedBy = challengeData?["postedBy"] as? String
                
                let video = ChallengeVideo(url: videoURLString, title: videoTitleName, uniqueID: videoUniqueID)
                
                self.videos.append(video)
                
                if snapshot.childSnapshot(forPath: videoUniqueID).hasChild("responses") {
                    
                    var responsesArray: [ChallengeVideo] = []
                    
                    for response in snapshot.childSnapshot(forPath: videoUniqueID).childSnapshot(forPath: "responses").children.allObjects {
                        
                        let responseProfile = response as! FIRDataSnapshot
                        let responseData = responseProfile.value as? NSDictionary
                        
                        let responseUniqueID = responseProfile.key
                        let responseVideoURL = responseData?["URL"] as? String
//                        let responseUserEmail = responseData?["respondedBy"] as? String
                        
                        let responseVideo = ChallengeVideo(url: responseVideoURL, title: nil, uniqueID: responseUniqueID)
                        
                        responsesArray.append(responseVideo)
                    }
//                    self.responses.updateValue(responsesArray, forKey: videoUniqueID)
                }
                else {
//                    self.responses.updateValue([], forKey: videoUniqueID)
                }
            }
            
            self.collectionView?.reloadData()
            self.collectionView?.isUserInteractionEnabled = true
            self.hideActivityIndicator()
            
        }, withCancel: { (error) in
//            self.displayNoChallenges()
            self.hideActivityIndicator()
        })
    }
    
    
}
