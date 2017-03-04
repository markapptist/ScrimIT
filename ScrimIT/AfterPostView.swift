//
//  AfterPostView.swift
//  PoplurDemo
//
//  Created by Anthony Ma on 5/11/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit
import AVFoundation

class AfterPostView: UIViewController {
    
    var videoPlayer: AVPlayer?
    
    var videoLayer: AVPlayerLayer?
    
    var downloadedURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoURL = URL(string: downloadedURL!)
        
        videoPlayer = AVPlayer(url: videoURL!)
        
        videoLayer = AVPlayerLayer(player: videoPlayer)
        videoLayer?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        view.layer.addSublayer(videoLayer!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        videoLayer?.player?.play()
    }

}
