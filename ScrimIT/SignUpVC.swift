//
//  SignUpVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-14.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpVC: SignUpLogInVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
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
