//
//  VideoCellFunctions.swift
//  ScrimIT
//
//  Created by Anthony Ma on 28/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

extension VideoCollectionViewCell {
    
    // submission button
    func seeSubmissions() {
        let submissionVC = SubmissionsVC()
        submissionVC.videoID? = (self.cellVideo?.uniqueID)!
        
        // navigation controller push
    }
    
    // scrimIT now // delegate instead
    func scrimIT() {
        // image picker for responding
        // variables to send over
        // tab controller present
    }
}
