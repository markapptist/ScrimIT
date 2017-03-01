//
//  TrainingVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class TrainingVC: TabsVC {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)

        // Do any additional setup after loading the view.
        
        self.tabItem = UITabBarItem(title: "Training", image: UIImage(named: "ico-training"), selectedImage: UIImage(named: "ico-training"))
        self.tabBarItem = self.tabItem

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
