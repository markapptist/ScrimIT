//
//  SignUpLogInVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-22.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpLogInVC: UIViewController {
    

    let formStackView = UIStackView()
    let headerStackView = UIStackView()
    let logoStackView = UIStackView()
    
    var passwordField: UITextField!
    var signInButton: UIButton!
    var signInLabel: UILabel!
    var forgotButton: UIButton!
    var backToSignIn: UIButton!
    var recoverLabel: UILabel!
    var recoverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formStackView.axis = .vertical
        formStackView.alignment = .fill
        formStackView.distribution = .fillProportionally
        formStackView.spacing = 8
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(formStackView)
        
        view.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[formStackView]-20-|", options: [.alignAllRight,.alignAllLeft], metrics: nil, views: ["formStackView": formStackView])
        )
        view.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[formStackView]-8-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: ["formStackView": formStackView])
        )
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .fill
        headerStackView.distribution = .fill
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        logoStackView.axis = .vertical
        logoStackView.alignment = .center
        logoStackView.distribution = .fillProportionally
        logoStackView.spacing = 8
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let appLogoImageView = UIImageView(image: UIImage(named: "Icon")!)
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        appLogoImageView.addConstraint(
            NSLayoutConstraint(item: appLogoImageView, attribute: .width, relatedBy: .equal, toItem: appLogoImageView, attribute: .height, multiplier: 1, constant: 0)
        )
        logoStackView.addArrangedSubview(appLogoImageView)
        
        let appNameLabel = UILabel()
        appNameLabel.numberOfLines = 0
        appNameLabel.textAlignment = .center
        appNameLabel.text = "Welcome To Scrimit"
        logoStackView.addArrangedSubview(appNameLabel)
        
        headerStackView.addArrangedSubview(logoStackView)
        
        signInLabel = UILabel()
        signInLabel.numberOfLines = 0
        signInLabel.textAlignment = .center
        signInLabel.text = "Please sign in below using your username and password"
        headerStackView.addArrangedSubview(signInLabel)
        
        recoverLabel = UILabel()
        recoverLabel.numberOfLines = 0
        recoverLabel.textAlignment = .center
        recoverLabel.text = "Please type your email below in order to recover your password"
        headerStackView.addArrangedSubview(recoverLabel)
        
        formStackView.addArrangedSubview(headerStackView)
        
        let emailField = UITextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.borderStyle = .roundedRect
        emailField.placeholder = "Email Address"
        formStackView.addArrangedSubview(emailField)
        
        emailField.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[emailField(<=30)]", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: ["emailField": emailField])
        )
        
        passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Password"
        formStackView.addArrangedSubview(passwordField)
        
        passwordField.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[passwordField(<=30)]", options: .alignAllCenterY, metrics: nil, views: ["passwordField": passwordField])
        )
        
        recoverButton = UIButton(type: .system)
        recoverButton.translatesAutoresizingMaskIntoConstraints = false
        recoverButton.backgroundColor = UIColor.purple
        recoverButton.setTitleColor(UIColor.white, for: UIControlState())
        recoverButton.setTitle("Recover password", for: UIControlState())
        formStackView.addArrangedSubview(recoverButton)
        recoverButton.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[recoverButton(<=44)]", options: .alignAllCenterY, metrics: nil, views: ["recoverButton": recoverButton])
        )
        
        backToSignIn = UIButton(type: .system)
        backToSignIn.translatesAutoresizingMaskIntoConstraints = false
        backToSignIn.setTitleColor(UIColor.black, for: UIControlState())
        backToSignIn.setTitle("Back to Sign In", for: UIControlState())
        formStackView.addArrangedSubview(backToSignIn)
        
        backToSignIn.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[backToSignIn(<=44)]", options: .alignAllCenterY, metrics: nil, views: ["backToSignIn": backToSignIn])
        )
        
        backToSignIn.addTarget(self, action: #selector(backToSignInTapped(_:)), for: UIControlEvents.touchUpInside)
        
        signInButton = UIButton(type: .system)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.backgroundColor = UIColor.purple
        signInButton.setTitleColor(UIColor.white, for: UIControlState())
        signInButton.setTitle("Sign In", for: UIControlState())
        formStackView.addArrangedSubview(signInButton)
        
        signInButton.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[signInButton(<=44)]", options: .alignAllCenterY, metrics: nil, views: ["signInButton": signInButton])
        )
        
        forgotButton = UIButton(type: .system)
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.setTitleColor(UIColor.black, for: UIControlState())
        forgotButton.setTitle("Forgot your password?", for: UIControlState())
        formStackView.addArrangedSubview(forgotButton)
        
        forgotButton.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:[forgotButton(<=44)]", options: .alignAllCenterY, metrics: nil, views: ["forgotButton": forgotButton])
        )
        
        forgotButton.addTarget(self, action: #selector(forgotTapped(_:)), for: UIControlEvents.touchUpInside)
        
        hideRecoverControls()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.verticalSizeClass == .compact  {
            headerStackView.axis = .horizontal
        } else {
            headerStackView.axis = .vertical
        }
    }
    
    func forgotTapped(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.2, animations: { [] () -> Void in
            self.signInButton.isHidden = true
            self.signInLabel.isHidden = true
            self.forgotButton.isHidden = true
            self.passwordField.isHidden = true
            self.recoverButton.isHidden = false
            self.recoverLabel.isHidden = false
            self.backToSignIn.isHidden = false
        })
    }
    
    func backToSignInTapped(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.2, animations: { [] () -> Void in
            self.signInButton.isHidden = false
            self.signInLabel.isHidden = false
            self.forgotButton.isHidden = false
            self.passwordField.isHidden = false
            self.recoverButton.isHidden = true
            self.recoverLabel.isHidden = true
            self.backToSignIn.isHidden = true
        })
    }
    
    func hideRecoverControls() {
        signInButton.isHidden = false
        forgotButton.isHidden = false
        passwordField.isHidden = false
        recoverButton.isHidden = true
        recoverLabel.isHidden = true
        backToSignIn.isHidden = true
    }
}
