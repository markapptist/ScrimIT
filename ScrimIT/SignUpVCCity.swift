//
//  SignUpVCCity.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-28.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpVCCity: SignUpLogInVC {
    
    let displayTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        nextButton.isHidden = false
        nextButton.alpha = 1.0
        questionLabel.isHidden = false
        questionLabel.text = "Enter your city"
        
        displayTextField.textAlignment = .center
        displayTextField.borderStyle = .roundedRect
        displayTextField.font = UIFont(name: "MyriadPro-BoldCond", size: 20)

        
        self.view.addSubview(displayTextField)
        
        displayTextField.translatesAutoresizingMaskIntoConstraints = false
        displayTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20).isActive = true 
        displayTextField.centerXAnchor.constraint(equalTo: questionLabel.centerXAnchor).isActive = true
        displayTextField.widthAnchor.constraint(equalTo: questionLabel.widthAnchor, multiplier: 0.9).isActive = true
        displayTextField.heightAnchor.constraint(equalTo: questionLabel.heightAnchor, multiplier: 1.0).isActive = true
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayTextField.resignFirstResponder()
    }
    
    override func nextBtnPressed() {
        if(!(displayTextField.text?.isEmpty)!) {
            userDefaults.setValue(displayTextField.text, forKey: "city")
            self.navigationController?.pushViewController(SignUpVCName(), animated: false)
        }
    }
    
}


