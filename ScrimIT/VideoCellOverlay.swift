//
//  VideoCellOverlay.swift
//  ScrimIT
//
//  Created by Anthony Ma on 26/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class VideoCellOverlay: UIView {
    
    var challengeTitle: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        challengeTitle = UILabel()
        self.addSubview(challengeTitle!)
        challengeTitle?.translatesAutoresizingMaskIntoConstraints = false
        challengeTitle?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        challengeTitle?.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        challengeTitle?.widthAnchor.constraint(equalTo: self.widthAnchor, constant: frame.width).isActive = true
        challengeTitle?.heightAnchor.constraint(equalTo: self.heightAnchor, constant: frame.height * 0.10).isActive = true
        challengeTitle?.font = UIFont(name: "Myriad-Pro-Condensed_31633", size: frame.height * 0.10)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
