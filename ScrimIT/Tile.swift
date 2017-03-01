//
//  Tiles.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-01.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class Tile: UIView {
    
    var width = screenWidth
    
    var height = screenHeight/4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
