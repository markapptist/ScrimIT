//
//  VideoCollectionViewCell.swift
//  ScrimIT
//
//  Created by Anthony Ma on 14/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    
    var tapGesture: UITapGestureRecognizer?
    var playing: Bool = false
    
    var outerView: VideoBackgroundView?
    
    var video: ChallengeVideo?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func layoutSubviews() {
        tapGesture = UITapGestureRecognizer()
        tapGesture?.addTarget(self, action: #selector(self.videoTapped))
        tapGesture?.numberOfTapsRequired = 1
        
        outerView = VideoBackgroundView(frame: contentView.bounds)
        
        contentView.backgroundColor = UIColor.clear
        
        contentView.addSubview(outerView!)
        
        if video != nil {
            let urlString = video?.url
            let videoURL = URL(string: urlString!)
            
            player = AVPlayer(url: videoURL!)
            playerLayer = AVPlayerLayer()
            
            playerLayer?.player = player
            playerLayer?.frame = outerView!.videoBox!.frame
            playerLayer?.masksToBounds = true
            playerLayer?.videoGravity = AVLayerVideoGravityResizeAspect
            
            contentView.layer.addSublayer(playerLayer!)
            
            contentView.addGestureRecognizer(tapGesture!)
        }
    }
    
    func videoTapped() {
        if (playing) {
            self.player?.pause()
            playing = false
            return
        }
        if (player?.currentTime() == player?.currentItem?.duration) {
            self.player?.seek(to: kCMTimeZero)
            self.player?.play()
            playing = true
            return
        }
        self.player?.play()
        playing = true
    }
    
}
