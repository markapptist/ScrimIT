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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
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
        */
 
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "videoCell")
        self.view.addSubview(collectionView!)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)! + 20).isActive = true
        collectionView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)! - 20).isActive = true
        collectionView?.showsVerticalScrollIndicator = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getPublicChallenges()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // check whether video is taken in portrait
        return CGSize(width: view.frame.width, height: 400)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
        let video = self.videos[indexPath.row]
        cell.video = video
        
        return cell
    }
    
    
    
}
