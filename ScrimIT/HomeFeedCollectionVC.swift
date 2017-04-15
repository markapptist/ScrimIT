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
    
    var collectionView: UICollectionView!
    
    let ref = DataService.instance.challengesRef
    
    var addButton: UIButton?
    
    // model
    var videos = [ChallengeVideo]()
    
    let newChallenge = ImagePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPublicChallenges()
        
        addButton = UIButton()
        addButton?.frame = CGRect(x: view.frame.width - (view.frame.width * 0.92), y: (self.navigationController?.navigationBar.frame.maxY)! + 10, width: view.frame.width * 0.85, height: 50)
        addButton?.setTitle("post new challenge", for: .normal)
        addButton?.layer.borderColor = UIColor.clear.cgColor
        addButton?.layer.cornerRadius = 8
        addButton?.titleLabel?.textColor = UIColor.white
        addButton?.layer.borderWidth = 2
        addButton?.backgroundColor = UIColor.lightGray
        addButton?.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        addButton?.addTarget(self, action: #selector(addButtonFunction), for: .touchUpInside)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "videoCell")
        collectionView.frame = CGRect(x: 0, y: (addButton?.frame.maxY)! * 1.1, width: view.frame.width, height: view.frame.height - (self.tabBarController?.tabBar.frame.height)! - (self.navigationController?.navigationBar.frame.height)! - 20 - 80)
        collectionView.contentSize = CGSize(width: view.frame.width, height: 480.0)
        
//        collectionView.allowsSelection = true
        
        view.addSubview(addButton!)
        view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // check whether video is taken in portrait
        return CGSize(width: view.frame.width, height: 320)
    }
    
    
    func addButtonFunction() {
        //        newChallenge.cameraFor = .new
        //        newChallenge.challengeTitle = "test"
        self.navigationController?.pushViewController(newChallenge, animated: true)
        //        self.present(newChallenge, animated: true)
    }
    
    
    // MARK: - Collection View DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
        cell.video = self.videos[indexPath.row]
        
//        let embededHTML = "<html><body><iframe src=\"\(self.videos[indexPath.row])?playsinline=1\" width=\"'\(cell.frame.width)'\" height=\"'\(cell.frame.height)'\" frameborder=\"10\" allowfullscreen></iframe></body></html>"
//        
//        cell.webView?.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
//        cell.webView?.scrollView.isScrollEnabled = false

        let video = self.videos[indexPath.row]
//        cell.webView?.loadHTMLString(video.url!, baseURL: nil)
        let url = URL(string: video.url!)
        let data = NSData(contentsOf: url!)
        cell.webView?.load(data as! Data, mimeType: "mov", textEncodingName: String(), baseURL: NSURL() as URL)
//        cell.webView.
        
        
        return cell
    }
    
    
    
}
