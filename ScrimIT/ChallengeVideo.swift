//
//  ChallengeVideo.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation

class ChallengeVideo: NSObject {
    
    var url: String?
    var title: String?
    var uniqueID: String?
    
    init(url: String?, title: String?, uniqueID: String?) {
        self.url = url
        self.title = title
        self.uniqueID = uniqueID
    }
}
