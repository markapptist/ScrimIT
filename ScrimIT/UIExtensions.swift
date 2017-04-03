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

extension UITextField {
    
    func offset() {
        CATransaction.begin()
        
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = self.layer.position.y
        moveUp.toValue = self.layer.position.y - 30
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        self.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
    }
    
    func reset() {
        CATransaction.begin()
    
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = self.layer.position.y - 30
        moveUp.toValue = self.layer.position.y
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        self.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
    }
    
}

extension CustomTextFieldContainer {
    
    func offset() {
        CATransaction.begin()
        
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = self.layer.position.y
        moveUp.toValue = self.layer.position.y - 30
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        self.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
    }
    
    func reset() {
        CATransaction.begin()
        
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = self.layer.position.y - 30
        moveUp.toValue = self.layer.position.y
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        self.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
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
    
    func rotate360Degrees(duration: CFTimeInterval = 8) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func stopAnimations() {
        self.layer.removeAllAnimations()
    }
    
    
}

extension UIButton {
    func setColorRed() {
        self.backgroundColor = UIColor.init(red: 212/255, green: 107/255, blue: 107/255, alpha: 1.0)
    }
    
    func setColorBlue() {
        self.backgroundColor = UIColor.init(red: 58/255, green: 93/255, blue: 131/255, alpha: 1.0)
    }
    
    func setColorGreen() {
        self.backgroundColor = UIColor.init(red: 58/255, green: 131/255, blue: 108/255, alpha: 1.0)
    }
    
    func setColorOrange() {
        self.backgroundColor = UIColor.init(red: 211/255, green: 115/255, blue: 76/255, alpha: 1.0)
    }
    
    func setColorClear() {
        self.backgroundColor = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.80)
    }
    
    func setColourWhite() {
        self.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    func setColourVerifiedGreen() {
        self.backgroundColor = UIColor.init(red: 0/255, green: 203/255, blue: 9/255, alpha: 1.0)
    }

}
