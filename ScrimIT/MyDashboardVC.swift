//
//  MyDashboardVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-23.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

var navBarDelegate: tabPressed?

class MyDashboardVC: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let homeTab = HomeFeedVC()
        let trainingTab = TrainingVC()
        let challengesTab = ChallengesVC()
        let profileTab = ProfileVC()
        
        self.tabBar.barTintColor = barTint
        
        tabBarController?.delegate = self
                
        self.viewControllers = [homeTab, trainingTab, challengesTab, profileTab]
        
        
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
     
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
