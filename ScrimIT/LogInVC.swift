//
//  LogInVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-14.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit


let states = ["LoggingIn", "SigningUp"]

var currentLogInState = " "

class LogInVC: SignUpLogInVC {
    
    let faceBookBtn = CircleButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    
     var emailField = CustomTextFieldContainer()
    
     var passwordField = CustomTextFieldContainer()
    
    var loginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        faceBookBtn.animateRadius(scale: 1.2, soundOn: false)
        
        self.view.addSubview(faceBookBtn)
        
        if(currentLogInState == states[0]) {
            faceBookBtn.isHidden = false
        }
        
        if(currentLogInState == states[1]) {
            faceBookBtn.isHidden = true 
        }
        
        faceBookBtn.setImage(UIImage(named: "facebookIcon"), for: .normal)
        faceBookBtn.contentMode = .scaleAspectFit
        faceBookBtn.translatesAutoresizingMaskIntoConstraints = false
        faceBookBtn.setColorBlue()
        faceBookBtn.layer.borderWidth = 2.0
        faceBookBtn.layer.borderColor = UIColor.white.cgColor
        faceBookBtn.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20).isActive = true
        faceBookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        faceBookBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        faceBookBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.emailField.setup(placeholder: "Email", validator: "email", type: "email")
        self.passwordField.setup(placeholder: "Password", validator: "required", type: "password")
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailField)
        emailField.backgroundColor = UIColor.white
        emailField.textField.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        emailField.textField.textColor = UIColor.black
        emailField.topAnchor.constraint(equalTo: faceBookBtn.bottomAnchor, constant: 20).isActive = true
        emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emailField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        emailField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordField)
        passwordField.backgroundColor = UIColor.white
        passwordField.textField.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        passwordField.textField.textColor = UIColor.black
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        passwordField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        passwordField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        nextButton.isHidden = false
    }
    
    override func nextBtnPressed() {

        _ = validate(showError: true)
        
        if(!validate(showError: true)) {
            return
        } else {
            AuthService.instance.login(email: self.emailField.textField.text!, password: self.passwordField.textField.text!) {
                Completion in
                
                if(Completion.0 == nil) {
                    self.navigationController?.pushViewController(ProfileVC(), animated: false)
                } else {
                    ErrorHandler.sharedInstance.show(message: Completion.0!, container: self)
                    
                }
            }
        }
    }
    
    func validate(showError: Bool) -> Bool {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
        if(!emailField.validate()) {
            if(showError) {
                if(emailField.validationError == "blank") {
                    ErrorHandler.sharedInstance.show(message: "Email Field Cannot Be Blank", container: self)
                }
                if(emailField.validationError == "not_email") {
                    ErrorHandler.sharedInstance.show(message: "You should double-check that email address....", container: self)
                }
            }
            return false
        }
        
        if(!passwordField.validate()) {
            if(showError) {
                if(passwordField.validationError == "blank") {
                    ErrorHandler.sharedInstance.show(message: "Password Field Cannot Be Blank", container: self)
                }
            }
            return false
        }
        return true
    }


    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailField.textField.resignFirstResponder()
        passwordField.textField.resignFirstResponder()
        
        if(!(emailField.textField.text?.isEmpty)!) {
            if(!(passwordField.textField.text?.isEmpty)!) {
                nextButton.alpha = 1.0
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
