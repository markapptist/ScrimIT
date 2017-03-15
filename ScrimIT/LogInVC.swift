//
//  LogInVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-14.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class LogInVC: SignUpLogInVC {
    
    let faceBookBtn = CircleButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        faceBookBtn.animateRadius(scale: 1.2, soundOn: false)
        
        self.view.addSubview(faceBookBtn)
        
        faceBookBtn.translatesAutoresizingMaskIntoConstraints = false
        faceBookBtn.setColorBlue()
        faceBookBtn.layer.borderWidth = 2.0
        faceBookBtn.layer.borderColor = UIColor.white.cgColor
        faceBookBtn.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20).isActive = true
        faceBookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        faceBookBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        faceBookBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
