//
//  ScrimITButton.swift
//  ScrimIT
//
//  Created by Anthony Ma on 26/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class ScrimITButton: UIButton {
    
    enum ButtonTitle {
        case scrimIT
        case submission
    }
    
    override var buttonType: UIButtonType {
        return .system
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setColourVerifiedGreen()
        self.titleLabel?.font = UIFont(name: "Myriad-Pro-Condensed_31633", size: 17)
        self.layer.cornerRadius = 10
        
    }
    
    func setButtonTitle(buttonTitle: ButtonTitle) {
        if buttonTitle == .scrimIT {
            self.setTitle("ScrimIT Now!", for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
        }
        if buttonTitle == .submission {
            self.setTitle("Recent submission!", for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
