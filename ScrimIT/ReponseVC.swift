//
//  ReponseVC.swift
//  ScrimIT
//
//  Created by Anthony Ma on 3/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ResponseVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // model
    var numberOfResponses: [ChallengeVideo]? = nil
    
    // variables
    var currentChallengeURL: String?
    var challengeTitle: String?
    var videoUniqueID: String?
    
    // view variables
    var respondButton: UIButton?
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        let videosContainer = UIView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height - (self.navigationController?.navigationBar.frame.height)! - (self.tabBarController?.tabBar.frame.height)! - 20))
        
        
        let videoURL = URL(string: currentChallengeURL!)
        
        player = AVPlayer(url: videoURL!)
        playerLayer = AVPlayerLayer()
        playerLayer?.player = player
        
        playerLayer?.masksToBounds = true
        playerLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer?.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: view.frame.width, height: videosContainer.frame.height/2)
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: (playerLayer?.frame.maxY)!, width: view.frame.width, height: videosContainer.frame.height/2))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        let hiddenTabBar = UIView(frame: CGRect(x: 0, y: (tableView?.frame.maxY)!, width: view.frame.height, height: (self.tabBarController?.tabBar.frame.height)!))
        hiddenTabBar.backgroundColor = UIColor.white
        
        respondButton = UIButton(type: .system)
        respondButton?.frame = CGRect(x: hiddenTabBar.center.x - (view.frame.width * 0.60)/2, y: hiddenTabBar.bounds.minY, width: view.frame.width * 0.60, height: hiddenTabBar.frame.height)
        respondButton?.setTitle("Respond", for: .normal)
        respondButton?.addTarget(self, action: #selector(respondButtonFunction), for: .touchUpInside)
        
        view.layer.addSublayer(playerLayer!)
        view.addSubview(hiddenTabBar)
        view.addSubview(tableView!)
        hiddenTabBar.addSubview(respondButton!)
    }
    
    func respondButtonFunction() {
        /*
        let camera = CameraVC()
        camera.cameraFor = .response
        camera.responseToVideoID = self.videoUniqueID
        camera.challengeTitle = self.challengeTitle
        self.navigationController?.pushViewController(camera, animated: true)
        */
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let responseCount = self.numberOfResponses?.count {
            return responseCount
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = self.numberOfResponses?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = video?.url
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = self.numberOfResponses?[indexPath.row]
        let afterPost = AfterPostView()
        afterPost.downloadedURL = video?.url
        self.navigationController?.pushViewController(afterPost, animated: true)
    }
}
