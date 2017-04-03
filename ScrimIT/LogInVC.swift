//
//  LogInVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-14.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

let states = ["LoggingIn", "SigningUp"]

var currentLogInState = " "

let faceBookBtn = FBSDKLoginButton()

class LogInVC: SignUpLogInVC, FBSDKLoginButtonDelegate {
    
     var emailField = CustomTextFieldContainer()
    
     var passwordField = CustomTextFieldContainer()
    
    var loginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        self.view.addSubview(faceBookBtn)
        
        if(currentLogInState == states[0]) {
            faceBookBtn.isHidden = false
        }
        
        if(currentLogInState == states[1]) {
            faceBookBtn.isHidden = true 
        }
        
        
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailField)
        emailField.backgroundColor = UIColor.white
        emailField.textField.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        emailField.textField.textColor = UIColor.black
        emailField.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20).isActive = true
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
        
        self.emailField.setup(placeholder: "Email", validator: "email", type: "email")
        self.passwordField.setup(placeholder: "Password", validator: "required", type: "password")

        
        faceBookBtn.translatesAutoresizingMaskIntoConstraints = false
        faceBookBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        faceBookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        faceBookBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        faceBookBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
  
        faceBookBtn.delegate = self
        
        nextButton.isHidden = false
        
        self.navigationItem.setHidesBackButton(false, animated: true)

        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        if((result.grantedPermissions) != nil){
            self.navigationController?.pushViewController(ProfileVC(), animated: false)
            print("Successfully logged in with facebook....")
            userDefaults.set(true, forKey: "userLoggedIn")
            self.showEmailAddress()
        }
        
        
    }
    
    func showEmailAddress() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            
            if error != nil {
                print("Something went wrong with our facebook user: ", error)
            }
            print("Successfully logged in with our user: ", user)
        })
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
        }
    }
 
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
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
                    userDefaults.set(true, forKey: "userLoggedIn")
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

}
