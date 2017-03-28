//
//  MessageView.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-27.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class MessageView: UIView {
    
    var messageContent: LabelCustomSpacing!
    
    var startPositionY: CGFloat = 0.0
    
    var messageShow = false
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: -70, width: 375, height: 90))
        self.backgroundColor = UIColor.black
        startPositionY = self.layer.position.y
        self.messageContent = LabelCustomSpacing(frame: CGRect(x: 68, y: 16, width: 240, height: 38))
        self.messageContent.textColor = UIColor.white
        self.messageContent.font = UIFont.init(name: "HelveticaNeue-Medium", size: 13)
        //   self.messageContent.font = UIFont.boldSystemFont(ofSize: 13)
        self.messageContent.numberOfLines = 0
        self.messageContent.text = "Hi"
        self.messageContent.textAlignment = .center
        self.messageContent.alpha = 0.0
        self.messageContent.setSpacing(space: 0.5)
        self.messageContent.lineBreakMode = .byWordWrapping
        
        self.addSubview(messageContent)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
    }
    
    func setUpConstraints(imgView: UIImageView?) {
        let trailingConstraint = superview?.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let leadingConstraint = self.leadingAnchor.constraint(equalTo: (superview?.leadingAnchor)!)
        let topConstraint = self.topAnchor.constraint(equalTo: (superview?.topAnchor)!, constant: -70)
        let bottomConstraint = imgView?.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 105)
        
        let labelTrailingConstraint = superview?.trailingAnchor.constraint(equalTo: messageContent.trailingAnchor, constant: 67)
        let labelLeadingConstraint = messageContent.leadingAnchor.constraint(equalTo: (superview?.leadingAnchor)!, constant: 68)
        let labelTopConstraint = messageContent.topAnchor.constraint(equalTo: (superview?.topAnchor)!, constant: 16)
        
        NSLayoutConstraint.activate([trailingConstraint!, leadingConstraint, topConstraint, bottomConstraint!, labelTrailingConstraint!, labelLeadingConstraint, labelTopConstraint])
        
    }
    
    func offsetImagePosition() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: 70)
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0) {
            self.messageContent.alpha = 1.0
            sleep(3)
            self.resetImagePosition()
            
        }
        
        messageShow = true
        
    }
    
    func resetImagePosition() {
        
        if messageShow == true {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform(translationX: 0, y: -70)
            }, completion: nil)
            
            messageShow = false
        }
    }
    
    
    
    
}

