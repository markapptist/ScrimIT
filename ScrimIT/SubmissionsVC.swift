//
//  SubmissionsVC.swift
//  ScrimIT
//
//  Created by Anthony Ma on 28/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class SubmissionsVC: TabsVC, UITableViewDataSource, UITableViewDelegate {
    
    // selected challenge
    var videoID: String?
    
    // view
    var tableView: UITableView?
    
    // model
    var submissions = [ChallengeVideo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // write function to create constraints for view with nav bar / set global variable
        tableView = UITableView()
        tableView?.register(SubmittedCell.self, forCellReuseIdentifier: "response")
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)! + 20).isActive = true
        tableView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView?.heightAnchor.constraint(equalToConstant: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)! - 20).isActive = true
        tableView?.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Table View Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.submissions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "response", for: indexPath) as! SubmittedCell
        let responseVideo = self.submissions[indexPath.row]
        cell.responseCellView?.nameLabel?.text = responseVideo.uniqueID
        return cell
    }
}
