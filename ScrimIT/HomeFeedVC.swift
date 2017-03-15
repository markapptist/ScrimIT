//
//  HomeFeedVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class HomeFeedVC: TabsVC, UITableViewDataSource, UITableViewDelegate {
    
    // database ref
    var ref: FIRDatabaseReference?
    
    // model
    var videos = [ChallengeVideo]()
    var responses = [String:[ChallengeVideo]]()
    
    var addButton: UIButton?
    
    var tableView: UITableView?
    
    let respondView = ResponseVC()
    
    let newChallenge = NewChallengeVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // challenges database reference
        self.ref = DataService.instance.challengesRef
        
        addButton = UIButton(type: .system)
        addButton?.frame = CGRect(x: view.frame.width - (view.frame.width * 0.15) - 20, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width * 0.15, height: 80)
        addButton?.setTitle("+", for: .normal)
        addButton?.titleLabel?.font = UIFont(name: "Avenir", size: 60)
        addButton?.addTarget(self, action: #selector(addButtonFunction), for: .touchUpInside)
        
        tableView = UITableView(frame: CGRect(x: 0, y: (addButton?.frame.maxY)!, width: view.frame.width, height: view.frame.height - (self.tabBarController?.tabBar.frame.height)! - (self.navigationController?.navigationBar.frame.height)! - 20 - 80))
        tableView?.register(VideoCell.self, forCellReuseIdentifier: "videoCell")
        tableView?.isUserInteractionEnabled = false
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        view.addSubview(addButton!)
        view.addSubview(tableView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.videos = []
        self.getPublicChallenges()
    }
    
    func addButtonFunction() {
        self.navigationController?.pushViewController(newChallenge, animated: true)
    }
    
    func displayNoChallenges() {
        let alert = UIAlertController(title: "No challenges", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = self.videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoCell
        cell.video = video
        return cell
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! VideoCell
        cell.player?.pause()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = self.videos[indexPath.row]
        respondView.currentChallengeURL = video.url
        respondView.videoUniqueID = video.uniqueID
        respondView.challengeTitle = video.title
        respondView.numberOfResponses = self.responses[video.uniqueID!]
        self.navigationController?.pushViewController(respondView, animated: true)
    }


}
