//
//  ProfileVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileVC: TabsVC, FBSDKLoginButtonDelegate {
    
    let fadePhoto = #imageLiteral(resourceName: "fadePhotoBottom")
    let titleView = UIView()
    let titleLbl = UILabel()
    let fadeView = UIImageView()
    
    let profileImgView = UIImageView()
    
    let scrollView = UIScrollView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "logout.png"), style: .done, target: self, action: #selector(rightBtnPressed))
        logoutBtn.tintColor = UIColor.lightGray
        self.navigationItem.setRightBarButton(logoutBtn, animated: true)
                
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 1.5)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        fadeView.image = fadePhoto
        fadeView.alpha = 0.5
        fadeView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(fadeView)
        
        fadeView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        fadeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        fadeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        fadeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true

        self.scrollView.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        titleLbl.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        titleLbl.font = UIFont(name: "MyriadPro-BoldCond", size: 46)
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.text = "Profile"
        titleLbl.textColor = UIColor.white
        titleLbl.setSpacing(space: -3.1)
        titleLbl.shadowColor = UIColor.white

        self.scrollView.addSubview(profileImgView)
        profileImgView.translatesAutoresizingMaskIntoConstraints = false
        profileImgView.makeRound()
        profileImgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
        profileImgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileImgView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        profileImgView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    
       self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
 
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func rightBtnPressed() {
        
        self.loginButtonDidLogOut(faceBookBtn)
        
        userDefaults.set(false, forKey: "userLoggedIn")
        let vc = SignUpLogInVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
