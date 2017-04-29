//
//  VideoBox.swift
//  ScrimIT
//
//  Created by Anthony Ma on 28/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class VideoBox: UIView {
    
    enum VideoBoxDestination {
        case feed
    }
    
    var videoBoxOverlay: VideoCellOverlay?
    var videoBoxView: UIView?
    var line: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        line = UIView()
        line?.backgroundColor = UIColor.white
        self.addSubview(line!)
        line?.translatesAutoresizingMaskIntoConstraints = false
        line?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        line?.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        line?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        line?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 2).isActive = true
        
        videoBoxView = UIView()
        self.addSubview(videoBoxView!)
        videoBoxView?.translatesAutoresizingMaskIntoConstraints = false
        videoBoxView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        videoBoxView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        videoBoxView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        videoBoxView?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0, constant: -2).isActive = true
    }
    
    func setVideoBox(destination: VideoBoxDestination) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
