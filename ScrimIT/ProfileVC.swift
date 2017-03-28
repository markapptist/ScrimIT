//
//  ProfileVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class ProfileVC: TabsVC {
    
    let fadePhoto = #imageLiteral(resourceName: "fadePhotoBottom")
    let titleView = UIView()
    let titleLbl = UILabel()
    let fadeView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
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
        titleLbl.font = UIFont(name: "MyriadPro-BoldCond", size: 46)
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.text = "Profile"
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

    
       self.navigationItem.setHidesBackButton(true, animated: true)
        
    }

}
