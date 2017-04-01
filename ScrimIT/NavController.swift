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
    
    var soccerImageView: UIImageView?
    var titleImageView: UIImageView?
    
    var fadeImgView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.navigationBar.isHidden = false

     
        
        self.fadeImgView = UIImageView()
        self.navigationBar.addSubview(self.fadeImgView!)
        fadeImgView?.image = #imageLiteral(resourceName: "fadePhotoBottom")
        fadeImgView?.alpha = 0.7
        fadeImgView?.translatesAutoresizingMaskIntoConstraints = false
        fadeImgView?.bottomAnchor.constraint(equalTo: self.navigationBar.bottomAnchor).isActive = true
        fadeImgView?.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true 
        fadeImgView?.widthAnchor.constraint(equalTo: self.navigationBar.widthAnchor).isActive = true
        fadeImgView?.heightAnchor.constraint(equalTo: self.navigationBar.heightAnchor, multiplier: 0.8).isActive = true
        fadeImgView?.isHidden = true
        
        let titleImgWidth = self.navigationBar.frame.width/9
        let titleImgHeight = self.navigationBar.frame.height * 0.6
        
        self.titleImageView = UIImageView()
        
        self.navigationBar.barTintColor = barTint
        self.navigationBar.addSubview(self.titleImageView!)
        self.titleImageView?.image = #imageLiteral(resourceName: "scrimit.png")
        self.titleImageView?.layer.shadowRadius = 10.0
        self.titleImageView?.layer.shadowColor = UIColor.black.cgColor
        self.titleImageView?.layer.shadowOffset = CGSize.zero
        self.titleImageView?.layer.shadowOpacity = 1.0
        self.titleImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.titleImageView?.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true
        self.titleImageView?.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor).isActive = true
        self.titleImageView?.widthAnchor.constraint(equalTo: self.navigationBar.widthAnchor, multiplier: 0.5).isActive = true
        self.titleImageView?.heightAnchor.constraint(equalTo: self.navigationBar.heightAnchor, multiplier: 0.5).isActive = true
        
        self.titleImageView?.contentMode = .scaleAspectFit
        
        self.soccerImageView = UIImageView()
        self.navigationBar.addSubview(self.soccerImageView!)
        soccerImageView?.image = #imageLiteral(resourceName: "soccerball.png")
        soccerImageView?.translatesAutoresizingMaskIntoConstraints = false
        soccerImageView?.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor).isActive = true
        soccerImageView?.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true
        soccerImageView?.widthAnchor.constraint(equalToConstant: titleImgWidth).isActive = true
        soccerImageView?.heightAnchor.constraint(equalToConstant: titleImgHeight).isActive = true
        soccerImageView?.alpha = 0.0
        
        soccerImageView?.contentMode = .scaleAspectFit
        
        _ = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(animateNavBar), userInfo: nil, repeats: true)

   
    }
    
    func animateNavBar() {
        
  
       UIView.animate(withDuration: 10.0, animations: {
        
        self.titleImageView?.alpha = 0.1
        self.soccerImageView?.alpha = 1.0
        self.soccerImageView?.rotate360Degrees()
        
       }) { (true) in
        
        UIView.animate(withDuration: 2.0, animations: {
            self.titleImageView?.alpha = 1.0
            self.soccerImageView?.alpha = 0.0
        }, completion: nil)
        
        }
        
    }

}

