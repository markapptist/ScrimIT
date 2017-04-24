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
        
        let backgroundViewFrame = CGRect(x: 20, y: 20, width: contentView.bounds.width - 40, height: contentView.bounds.height - 40)
        outerView = VideoBackgroundView(frame: backgroundViewFrame)
        
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
            
            outerView?.layer.addSublayer(playerLayer!)
            
            contentView.addGestureRecognizer(tapGesture!)
            
            outerView?.challengeNameLabel.text = video?.title
        }
    }
    
    func videoTapped() {
        if (playing) {
            self.player?.pause()
            playing = false
            return
        }
        if (player?.currentTime() == player?.currentItem?.duration) {
            self.player?.seek(to: kCMTimeZero, completionHandler: { (true) in
                self.player?.play()
                self.playing = true
                return
            })
        }
        self.player?.play()
        playing = true
    }
    
}
