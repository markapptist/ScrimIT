//
//  VideoCellTitleView.swift
//  ScrimIT
//
//  Created by Anthony Ma on 26/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class VideoCellTitleView: UIView {
    
    var profileIcon: UIImageView?
    var nameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /*
        profileIcon = UIImageView()
        self.addSubview(profileIcon!)
        profileIcon?.translatesAutoresizingMaskIntoConstraints = false
        profileIcon?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        profileIcon?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        profileIcon?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: frame.height).isActive = true
        profileIcon?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: frame.height).isActive = true
        profileIcon?.contentMode = .scaleAspectFit
        */
        
        // write constraints function to make active
        
        nameLabel = UILabel()
        
        nameLabel?.textColor = UIColor.black
        self.addSubview(nameLabel!)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        nameLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        nameLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        nameLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameLabel?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
