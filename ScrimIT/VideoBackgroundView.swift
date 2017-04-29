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
    
    var videoCellTitle: VideoCellTitleView?
    
    var videoBox: VideoBox?
    
    var videoCellFooter: VideoCellFooterView?
    var submissionFooter: VideoCellFooterView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        // cell title label
        videoCellTitle = VideoCellTitleView()
        self.addSubview(videoCellTitle!)
        videoCellTitle?.translatesAutoresizingMaskIntoConstraints = false
        videoCellTitle?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        videoCellTitle?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        videoCellTitle?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        videoCellTitle?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.10).isActive = true
        videoCellTitle?.backgroundColor = UIColor.white
        
        // video
        videoBox = VideoBox()
        self.addSubview(videoBox!)
        videoBox?.translatesAutoresizingMaskIntoConstraints = false
        videoBox?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        videoBox?.topAnchor.constraint(equalTo: (videoCellTitle?.bottomAnchor)!).isActive = true
        videoBox?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        videoBox?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.60).isActive = true
        
        // title and button
        videoCellFooter = VideoCellFooterView()
        videoCellFooter?.setFooterPlacement(footer: .top)
        self.addSubview(videoCellFooter!)
        videoCellFooter?.translatesAutoresizingMaskIntoConstraints = false
        videoCellFooter?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        videoCellFooter?.topAnchor.constraint(equalTo: (videoBox?.bottomAnchor)!).isActive = true
        videoCellFooter?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        videoCellFooter?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        // submissions
        submissionFooter = VideoCellFooterView()
        submissionFooter?.setFooterPlacement(footer: .bottom)
        self.addSubview(submissionFooter!)
        submissionFooter?.translatesAutoresizingMaskIntoConstraints = false
        submissionFooter?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        submissionFooter?.topAnchor.constraint(equalTo: (videoCellFooter?.bottomAnchor)!).isActive = true
        submissionFooter?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        submissionFooter?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
