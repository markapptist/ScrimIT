//
//  UIExtensions.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-22.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import QuartzCore

extension CALayer {
    static let rotationKeyPath = "transform.rotation"
    
    var center: CGPoint {
        return CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
}

extension UIColor {
    func green() -> CGColor {
        return UIColor(red: 158/255, green: 255/255, blue: 9/255, alpha: 1.0).cgColor
    }
    
    func blue() -> CGColor {
        return UIColor(red: 33/255, green: 253/255, blue: 197/255, alpha: 1.0).cgColor
    }
    
    func pink() -> CGColor {
        return UIColor(red: 251/255, green: 12/255, blue: 116/255, alpha: 1.0).cgColor
    }
    
    var darkened: UIColor {
        var hue = CGFloat()
        var saturation = CGFloat()
        var brightness = CGFloat()
        var alpha = CGFloat()
        
        getHue(
            &hue,
            saturation: &saturation,
            brightness: &brightness,
            alpha: &alpha
        )
        
        return UIColor(
            hue: min(hue * 1.1, 1),
            saturation: saturation,
            brightness: brightness * 0.7,
            alpha: alpha
        )
    }

}

extension CIColor {
    convenience init(darkening cgColor: CGColor) {
        self.init(
            color: UIColor(cgColor: cgColor).darkened
        )
    }
}


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
