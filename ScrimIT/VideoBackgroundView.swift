//
//  VideoBackgroundView.swift
//  ScrimIT
//
//  Created by Anthony Ma on 15/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class VideoBackgroundView: UIView {
    
    var videoBox: UIView?
    var challengeNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        videoBox = UIView()
        videoBox?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.90)
        videoBox?.backgroundColor = UIColor.black
        
        challengeNameLabel = UILabel()
        challengeNameLabel.frame = CGRect(x: 0, y: frame.maxY - (frame.height * 0.10), width: frame.width, height: frame.height * 0.10)
        
        self.addSubview(videoBox!)
        self.addSubview(challengeNameLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
