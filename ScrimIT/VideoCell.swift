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
    var video: ChallengeVideo? {
        didSet {
            
            let webView = UIWebView(frame: self.contentView.bounds)
            
            
            
            /*
            let urlString = video?.url
            let videoURL = URL(string: urlString!)
            
            player = AVPlayer(url: videoURL!)
            playerLayer = AVPlayerLayer()
            playerLayer?.player = player
            playerLayer?.frame = contentView.frame
            print(contentView.frame.height)
            playerLayer?.masksToBounds = true
            playerLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            contentView.layer.addSublayer(playerLayer!)
 */
        }
    }
    
    override func layoutSubviews() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.player?.play()
    }
}
