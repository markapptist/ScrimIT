//
//  Tiles.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-01.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class Tiles: UIView {
    
    var width: CGFloat!
    
    var height: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.width = screenWidth
        self.height = screenHeight/10
        
        self.frame = CGRect(x: 0.0, y: 0.0, width: self.width, height: self.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setColour(colour: UIColor) {
        self.backgroundColor = colour
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
