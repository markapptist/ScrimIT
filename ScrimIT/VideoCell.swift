//
//  VideoCell.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class VideoCell: UITableViewCell {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var video: ChallengeVideo?
    
    override func layoutSubviews() {
        
        let urlString = video?.url
        let videoURL = URL(string: urlString!)
        
        player = AVPlayer(url: videoURL!)
        playerLayer = AVPlayerLayer()
        playerLayer?.player = player
        
        playerLayer?.frame = contentView.bounds
        playerLayer?.masksToBounds = true
        
        playerLayer?.videoGravity = AVLayerVideoGravityResizeAspect
        
        contentView.layer.addSublayer(playerLayer!)
        
//        self.player?.play()
        
    }
}
