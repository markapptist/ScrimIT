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
//        videoBox?.translatesAutoresizingMaskIntoConstraints = false
        videoBox?.frame = CGRect(x: 20, y: 20, width: frame.width - 40, height: frame.height * 0.80 - 40)
//        videoBox?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//        videoBox?.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
//        videoBox?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40).isActive = true
//        videoBox?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -40).isActive = true
        videoBox?.backgroundColor = UIColor.white
        self.addSubview(videoBox!)
        
        challengeNameLabel = UILabel()
        challengeNameLabel.frame = CGRect(x: 0, y: frame.maxY - (frame.height * 0.10) - (frame.height * 0.2), width: frame.width, height: frame.height * 0.20)
        
        self.addSubview(videoBox!)
        self.addSubview(challengeNameLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
