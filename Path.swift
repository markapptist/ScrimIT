//
//  Path.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-28.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class Path: UIView {
    
    let sizeWidth: CGFloat =  5
    let sizeHeight: CGFloat = 150
    let lineWidth: CGFloat = 1
    
    var start: CGPoint!
    var end: CGPoint!
    
    var path: UIBezierPath!

    init(origin: CGPoint) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: sizeWidth, height: sizeHeight)))
        
        self.center = origin
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
  
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        path.move(to: CGPoint(x: 300, y: 300))
        UIColor.black.setFill()
        path.fill()
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
        
        
    }
    

}
