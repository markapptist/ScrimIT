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
    
    var titleImageView: UIImageView?
    var titleImg: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationBar.isHidden = true
        
        let titleImgWidth = self.navigationBar.frame.width/9
        let titleImgHeight = self.navigationBar.frame.height * 0.6

        self.titleImageView = UIImageView()

        self.navigationBar.barTintColor = barTint
        self.navigationBar.addSubview(self.titleImageView!)
        self.titleImg = UIImage(named: "soccerball")
        self.titleImageView?.image = self.titleImg
        
        self.titleImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.titleImageView?.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true
        self.titleImageView?.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor).isActive = true
        self.titleImageView?.widthAnchor.constraint(equalToConstant: titleImgWidth).isActive = true
        self.titleImageView?.heightAnchor.constraint(equalToConstant: titleImgHeight).isActive = true
        
        self.titleImageView?.contentMode = .scaleAspectFit
   
    }

}

