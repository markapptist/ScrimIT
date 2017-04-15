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
    
    
    var video: ChallengeVideo?
    var webView: UIWebView?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func prepareForReuse() {
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        webView = UIWebView()
        webView?.frame = contentView.bounds
        
        print(contentView.frame)
        
        if video != nil {
            
            /*
            let urlString = video?.url
            let videoURL = URL(string: urlString!)
            
            player = AVPlayer(url: videoURL!)
            playerLayer = AVPlayerLayer()
            playerLayer?.player = player
//            playerLayer?.frame = contentView.bounds
            playerLayer?.frame = CGRect(x: contentView.bounds.minX + 5, y: contentView.bounds.minY + 50, width: contentView.bounds.width - 10, height: contentView.bounds.height - 10)
            print(contentView.frame.height)
            playerLayer?.masksToBounds = true
            playerLayer?.videoGravity = AVLayerVideoGravityResizeAspect
            
            contentView.layer.addSublayer(playerLayer!)
             print(playerLayer?.frame)
             print(contentView.layer.sublayers)
             print(contentView.layer.sublayers?[0].frame)
            */
            
            webView?.allowsInlineMediaPlayback = true
//            webView?.allowsPictureInPictureMediaPlayback = true
            let url = URL(string: (video?.url)!)
            let request = URLRequest(url: url!)
            webView?.loadRequest(request)
//            webView?.backgroundColor = UIColor.blue
//            let url = URL(string: (video?.url!)!)
//            let data = NSData(contentsOf: url!)
//            webView?.load(data as! Data, mimeType: "mov", textEncodingName: String(), baseURL: NSURL() as URL)

        
        }
        contentView.addSubview(webView!)
    }
    
}
