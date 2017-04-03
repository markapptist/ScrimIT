//
//  SignUpVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-14.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpVCGender: SignUpLogInVC {
    
    let maleBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
    let femaleBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 300, height: 300))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        nextButton.isHidden = false
        questionLabel.isHidden = false
        questionLabel.text = "What is your gender?"
        
        maleBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(maleBtn)
        
        femaleBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(femaleBtn)
        
        maleBtn.backgroundColor = UIColor.darkGray
        maleBtn.isUserInteractionEnabled = true
        maleBtn.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5).isActive = false
        maleBtn.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor, constant: 60).isActive = true
        maleBtn.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -65).isActive = true
        maleBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        maleBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        maleBtn.setTitle("Male", for: .normal)
        maleBtn.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        maleBtn.layer.cornerRadius = 4
        maleBtn.addTarget(self, action: #selector(self.maleBtnPressed), for: .touchUpInside)
        
        femaleBtn.backgroundColor = UIColor.darkGray
        femaleBtn.isUserInteractionEnabled = true
        femaleBtn.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5).isActive = false
        femaleBtn.leadingAnchor.constraint(equalTo: maleBtn.trailingAnchor, constant: 35).isActive = true
        femaleBtn.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -65).isActive = true
        femaleBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        femaleBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        femaleBtn.setTitle("Female", for: .normal)
        femaleBtn.titleLabel?.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        femaleBtn.layer.cornerRadius = 4
        femaleBtn.addTarget(self, action: #selector(self.femaleBtnPressed), for: .touchUpInside)
        
        self.navigationItem.setHidesBackButton(false, animated: true)

    }
    
    func maleBtnPressed() {
        
        if(!maleBtn.isSelected) {
            maleBtn.isSelected = true
            femaleBtn.isSelected = false
            maleBtn.layer.borderWidth = 2
            nextButton.alpha = 1.0
        }
        
        else if(maleBtn.isSelected && !femaleBtn.isSelected) {
            maleBtn.isSelected = false
            maleBtn.layer.borderWidth = 2
            nextButton.alpha = 1.0
        }
        
    }
    
    func femaleBtnPressed() {
        
        if(!femaleBtn.isSelected) {
            femaleBtn.isSelected = true
            maleBtn.isSelected = false
            femaleBtn.layer.borderWidth = 2
            nextButton.alpha = 1.0
        }
            
            
        else if(femaleBtn.isSelected && !maleBtn.isSelected) {
            femaleBtn.isSelected = false
            femaleBtn.layer.borderWidth = 2
            nextButton.alpha = 1.0
        }

        
    }
    
   override func nextBtnPressed() {
    if(nextButton.alpha == 1.0) {
        if(maleBtn.isSelected) {
            userDefaults.set(true, forKey: "maleUser")
        }
        
        if(femaleBtn.isSelected) {
            userDefaults.set(true, forKey: "femaleUser")
        }
        self.navigationController?.pushViewController(SignUpVCAge(), animated: false)
    }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(maleBtn.isSelected) {
            maleBtn.isSelected = false
            maleBtn.layer.borderWidth = 0
        }
        
        if(femaleBtn.isSelected) {
            femaleBtn.isSelected = false
            femaleBtn.layer.borderWidth = 0
        }
        
        nextButton.alpha = 0.5
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
