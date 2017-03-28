//
//  CustomTextFieldContainer.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-27.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class CustomTextFieldContainer: UIView, UITextFieldDelegate {
    
    var iconCheck: UIImageView!
    var fieldLabel: UILabel!
    var underLine: UIView!
    var textField: UITextField!
    
    var placeholder : String!
    var selectedPlaceholder: String!
    var validator: String!
    var isAnimated: Bool = false
    var validationError: String!
    
    override init(frame: CGRect) {
        super.init(frame:frame);
        initialSetup()
        
        
        
    }
    
    func initialSetup() {
        iconCheck = UIImageView(frame: CGRect(x: 275, y: 18, width: 20, height: 21 ))
        iconCheck.image = UIImage.init(named: "iconCheck")
        fieldLabel = UILabel(frame: CGRect(x: 0, y: 17, width: 295, height: 21))
        iconCheck.isHidden = true
        fieldLabel.font = UIFont.init(name: "HelveticaNeue-Medium", size: 24)
        //   fieldLabel.font = UIFont.systemFont(ofSize: 14)
        fieldLabel.numberOfLines = 1
        fieldLabel.text = "Hello"
        fieldLabel.textAlignment = .left
        fieldLabel.alpha = 0.7
        fieldLabel.setSpacing(space: 0.5)
        
        textField = UITextField(frame:CGRect(x:0, y: 0, width: 295, height: 56))
        
        textField.textColor = UIColor.white
        textField.font = UIFont.init(name: "HelveticaNeue-Thin", size: 20)
        //   textField.font = UIFont.systemFont(ofSize: 14)
        textField.spellCheckingType = .no
        textField.delegate = self
        
        
        self.addSubview(iconCheck)
        self.addSubview(fieldLabel)
        self.addSubview(textField)
        
    }
    
    
    func setup(placeholder: String!, validator: String!, type: String!){
        
        self.placeholder = placeholder
        self.selectedPlaceholder = placeholder.uppercased()
        self.fieldLabel.text = placeholder
        self.validator = validator
        
        if(type == "email") {
            textField.keyboardType = .emailAddress
            textField.autocapitalizationType = .none
            textField.spellCheckingType = .no
            textField.autocorrectionType = .no
            
        } else if (type == "password") {
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.spellCheckingType = .no
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            
        } else {
            textField.keyboardType = .default
            textField.spellCheckingType = .no
        }
        
        
    }
    
    func validate() -> Bool {
        self.validationError = "";
        
        if(self.validator == "optional") {
            return true
        }
        
        if(self.validator == "required") {
            if(self.textField.text?.isBlank)! {
                self.validationError = "blank"
                return false
            }
        }
        
        if(self.validator == "email") {
            if(self.textField.text?.isBlank)! {
                self.validationError = "blank"
                return false
            }
            
            if(!(self.textField.text?.isEmail)!) {
                self.validationError = "not_email"
                return false
            }
        }
        self.iconCheck.isHidden = false
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
        if(!self.isAnimated) {
            self.offsetLabel()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
        self.textField.resignFirstResponder()
        if(!self.validate()) {
            if(self.validationError == "blank") {
                self.resetLabel()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialSetup()
        
        
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    func offsetLabel() {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.fieldLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
            //   self.fieldLabel.font = UIFont.boldSystemFont(ofSize: 14)
            self.fieldLabel.text = self.selectedPlaceholder
            self.fieldLabel.alpha = 1.0
            self.isAnimated = true
        }
        
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = fieldLabel.layer.position.y
        moveUp.toValue = fieldLabel.layer.position.y - 17
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        fieldLabel.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
    }
    
    func resetLabel() {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.fieldLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
            //    self.fieldLabel.font = UIFont.systemFont(ofSize: 14)
            self.fieldLabel.text = self.placeholder
            self.fieldLabel.alpha = 0.7
            self.isAnimated = false
        }
        
        let moveUp = CABasicAnimation(keyPath: "position.y")
        
        
        moveUp.fromValue = fieldLabel.layer.position.y - 17
        moveUp.toValue = fieldLabel.layer.position.y
        moveUp.duration = 0.1
        moveUp.beginTime = 0.0
        moveUp.fillMode = kCAFillModeForwards
        moveUp.isRemovedOnCompletion = false
        
        fieldLabel.layer.add(moveUp, forKey: "basic")
        
        CATransaction.commit()
    }
    
}

