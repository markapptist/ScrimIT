//
//  HomeFeedVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class HomeFeedVC: TabsVC {
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - (self.tabBarController?.tabBar.frame.height)!))
        
        view.backgroundColor = UIColor.white
        
    }

}
