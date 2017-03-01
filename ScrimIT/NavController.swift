//
//  NavController.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-01.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

let barTint = UIColor.init(red: 73/255, green: 82/255, blue: 62/255, alpha: 1.0)

class NavController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pushViewController(MyDashboardVC(), animated: true)
        
        self.navigationBar.barTintColor = barTint
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
