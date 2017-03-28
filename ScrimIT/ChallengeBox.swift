//
//  ChallengeBox.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-28.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class ChallengeBox: UIButton {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.label = UILabel()
        self.label.font = UIFont(name: "MyriadPro-BoldCond", size: 20.0)
        self.addSubview(label)
        self.layer.cornerRadius = 5.0
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        self.label.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        self.label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
