//
//  UIExtensions.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-22.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, attributeString.length))
            self.attributedText = attributeString
        }
    }
    
    func setSpacing(space: CGFloat) {
        
        let attributedString = NSMutableAttributedString(string: (self.text!))
        attributedString.addAttribute(NSKernAttributeName, value: space, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
        
    }
    
}

extension UIImageView {
    
    func makeRound() {
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}
