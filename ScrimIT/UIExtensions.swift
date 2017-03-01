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

extension UIView {
    
    func makeRound() {
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func animateViewToCoordinates(newX: CGFloat, newY: CGFloat) {
        
        let height = self.frame.height
        let width = self.frame.width
        
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.frame = CGRect(x: newX, y: newY, width: width, height: height)
        }, completion: { (complete: Bool) in
        })
        
    }
    
    func rotateView(duration: CFTimeInterval) {
        let rotateAnim = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnim.fromValue = 0.0
        rotateAnim.toValue = CGFloat(M_PI * 2.0)
        rotateAnim.duration = duration
        rotateAnim.repeatCount = Float.infinity
        self.layer.add(rotateAnim, forKey: nil)
        
    }
    
    func stopAnimations() {
        self.layer.removeAllAnimations()
    }
    
}
