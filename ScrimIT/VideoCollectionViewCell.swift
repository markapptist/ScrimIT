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
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var cellVideo: ChallengeVideo?
    
    var cellVideoDelegate: VideoCellDelegate?
    
    // view layout
    var customViewFrame: VideoBackgroundView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tapGesture = UITapGestureRecognizer()
        tapGesture?.addTarget(self, action: #selector(self.videoTapped))
        tapGesture?.numberOfTapsRequired = 1
        
        customViewFrame = VideoBackgroundView()
        customViewFrame?.submissionFooter?.submissionsButton?.addTarget(self, action: #selector(self.submissionsPressed), for: .touchUpInside)
        customViewFrame?.videoCellFooter?.scrimITButton?.addTarget(self, action: #selector(self.scrimITPressed), for: .touchUpInside)
        contentView.addSubview(customViewFrame!)
        customViewFrame?.translatesAutoresizingMaskIntoConstraints = false
        customViewFrame?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        customViewFrame?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        customViewFrame?.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        customViewFrame?.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    func setVideoToPlayer(video: ChallengeVideo) {
        customViewFrame?.videoBox?.addGestureRecognizer(tapGesture!)
        
        let urlString = video.url
        print(urlString)
        let videoURL = URL(string: urlString!)
        
        let challengeVideoAsset = AVAsset(url: videoURL!)
        let playerItem = AVPlayerItem(asset: challengeVideoAsset)
        
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravityResize
        
        customViewFrame?.videoBox?.videoBoxView?.layer.addSublayer(playerLayer!)
        playerLayer?.frame = (customViewFrame?.videoBox?.videoBoxView?.bounds)!
        
        customViewFrame?.videoCellTitle?.nameLabel?.text = video.title
    }
    
    func submissionsPressed() {
        cellVideoDelegate?.showSubmissions(videoID: (self.cellVideo?.uniqueID)!)
    }
    
    func scrimITPressed() {
        cellVideoDelegate?.scrimITNow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
