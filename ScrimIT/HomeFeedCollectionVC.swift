//
//  HomeFeedCollectionVC.swift
//  ScrimIT
//
//  Created by Anthony Ma on 14/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class HomeFeedCollectionVC: TabsVC, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    
    let ref = DataService.instance.challengesRef
    
    var addButton: UIButton?
    
    // model
    var videos = [ChallengeVideo]()
    
    var responses = [String:[ChallengeVideo]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "videoCell")
        collectionView?.showsVerticalScrollIndicator = false
        self.view.addSubview(collectionView!)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)! + 20).isActive = true
        collectionView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!).isActive = true
        
        // flow layout configure
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: view.frame.width, height: 400)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getPublicChallenges()
    }
    
    
    // MARK: - Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Collection View DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
        cell.cellVideoDelegate = self
        let video = self.videos[indexPath.row]
        cell.setVideoToPlayer(video: video)
        cell.cellVideo = video
        return cell
    }
}

extension HomeFeedCollectionVC: VideoCellDelegate {
    func showSubmissions(videoID: String) {
        let submissionsVC = SubmissionsVC()
        submissionsVC.submissions = self.responses[videoID]!
        submissionsVC.videoID = videoID
        self.navigationController?.pushViewController(submissionsVC, animated: true)
    }
    
    func scrimITNow() {
        let tabBarController = self.tabBarController as! MyDashboardVC
        tabBarController.currentOverlay = .response
        tabBarController.bringUpCamera()
    }
}
