//
//  SignUpLogInVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-22.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpLogInVC: TabsVC, UITextFieldDelegate {
    
    let fadePhoto = #imageLiteral(resourceName: "fadePhotoBottom")
    let titleView = UIView()
    let titleLbl = UILabel()
    
    let joinBtn = UIButton()
    let logInBtn = UIButton()

    let fadeView = UIImageView()

    func joinBtnPressed() {
        self.navigationController?.pushViewController(SignUpVCGender(), animated: false)
    }
    
    func loginBtnPressed() {
        self.navigationController?.pushViewController(LogInVC(), animated: false)
    }
    
    let nextButton = UIButton()
    let questionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        joinBtn.translatesAutoresizingMaskIntoConstraints = false
        logInBtn.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.layer.borderWidth = 4.0
        titleView.layer.borderColor = UIColor.white.cgColor
        titleView.backgroundColor = UIColor.clear
        titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10).isActive = true
        titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -10).isActive = true
        titleView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.33).isActive = true
        titleView.isUserInteractionEnabled = true
        titleView.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLbl.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleLbl.font = UIFont(name: "MyriadPro-BoldCond", size: 76)
        titleLbl.adjustsFontSizeToFitWidth = true 
        titleLbl.text = "SCRIMIT"
        titleLbl.textColor = UIColor.white
        titleLbl.setSpacing(space: -3.1)
        titleLbl.shadowColor = UIColor.white
        
        fadeView.image = fadePhoto
        fadeView.alpha = 0.5
        fadeView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(fadeView)
        
        fadeView.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        fadeView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        fadeView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        fadeView.heightAnchor.constraint(equalTo: titleView.heightAnchor, multiplier: 1.0).isActive = true

         self.view.addSubview(joinBtn)
        
        joinBtn.layer.borderWidth = 4.0
        joinBtn.layer.borderColor = UIColor.white.cgColor
        joinBtn.backgroundColor = UIColor.clear
        joinBtn.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        joinBtn.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        joinBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        joinBtn.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        
        joinBtn.setTitle("join", for: .normal)
        joinBtn.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 76)
        joinBtn.isUserInteractionEnabled = true
        joinBtn.addTarget(self, action: #selector(self.joinBtnPressed), for: .touchUpInside)
        let fadeView2 = UIImageView(image: fadePhoto)
        fadeView2.alpha = 0.5
        fadeView2.translatesAutoresizingMaskIntoConstraints = false
        joinBtn.addSubview(fadeView2)
        
        fadeView2.topAnchor.constraint(equalTo: joinBtn.topAnchor).isActive = true
        fadeView2.trailingAnchor.constraint(equalTo: joinBtn.trailingAnchor).isActive = true
        fadeView2.leadingAnchor.constraint(equalTo: joinBtn.leadingAnchor).isActive = true
        fadeView2.heightAnchor.constraint(equalTo: joinBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        self.view.addSubview(logInBtn)
        
        logInBtn.layer.borderWidth = 4.0
        logInBtn.layer.borderColor = UIColor.white.cgColor
        logInBtn.backgroundColor = UIColor.clear
        logInBtn.trailingAnchor.constraint(equalTo: joinBtn.trailingAnchor).isActive = true
        logInBtn.leadingAnchor.constraint(equalTo: joinBtn.leadingAnchor).isActive = true
        logInBtn.topAnchor.constraint(equalTo: joinBtn.bottomAnchor).isActive = true
        logInBtn.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true
        
        logInBtn.setTitle("login", for: .normal)
        logInBtn.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 76)
        logInBtn.isUserInteractionEnabled = true
        logInBtn.addTarget(self, action: #selector(self.loginBtnPressed), for: .touchUpInside)
        
        let fadeView3 = UIImageView(image: fadePhoto)
        fadeView3.alpha = 0.5
        fadeView3.translatesAutoresizingMaskIntoConstraints = false
        logInBtn.addSubview(fadeView3)
        
        fadeView3.topAnchor.constraint(equalTo: logInBtn.topAnchor).isActive = true
        fadeView3.trailingAnchor.constraint(equalTo: logInBtn.trailingAnchor).isActive = true
        fadeView3.leadingAnchor.constraint(equalTo: logInBtn.leadingAnchor).isActive = true
        fadeView3.heightAnchor.constraint(equalTo: logInBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        nextButton.setTitle("next", for: .normal)
        nextButton.backgroundColor = UIColor.lightGray
        nextButton.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 26)
        nextButton.alpha = 0.5
        nextButton.isHidden = true
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: 0).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        nextButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        nextButton.addTarget(self, action: #selector(self.nextBtnPressed), for: .touchUpInside)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(questionLabel)
        questionLabel.isHidden = true 
        questionLabel.textAlignment = .center
        
        questionLabel.font = UIFont(name: "MyriadPro-BoldCond", size: 26)
        questionLabel.textColor = UIColor.white
        questionLabel.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5).isActive = true
        questionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        questionLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
    }
    
    func nextBtnPressed() {
        
    }
    
  
    
  
}
