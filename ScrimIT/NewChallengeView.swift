//
//  NewChallengeView.swift
//  ScrimIT
//
//  Created by Anthony Ma on 23/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class NewChallengeView: UIView {
    
    enum ViewFor {
        case newChallenge
        case response
    }
    
    var titleLabel: UILabel?
    var titleTextfield: UITextField?
    var nextButton: UIButton?
    
    var challengeID: String?
    var challengeTitle: String?
    
    // video details delegate
    var detailsDelegate: SetVideoDetails?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        titleTextfield = UITextField()
        self.addSubview(titleTextfield!)
        titleTextfield?.translatesAutoresizingMaskIntoConstraints = false
        titleTextfield?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titleTextfield?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        titleTextfield?.widthAnchor.constraint(equalToConstant: self.frame.width * 0.50).isActive = true
        titleTextfield?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleLabel = UILabel()
        self.addSubview(titleLabel!)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titleLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        titleLabel?.widthAnchor.constraint(equalToConstant: self.frame.width * 0.50).isActive = true
        titleLabel?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nextButton = UIButton(type: .system)
        self.addSubview(nextButton!)
        nextButton?.translatesAutoresizingMaskIntoConstraints = false
        nextButton?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextButton?.topAnchor.constraint(equalTo: (self.titleLabel?.bottomAnchor)!, constant: 50).isActive = true
        nextButton?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nextButton?.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    }
    
    func setViewFor(type: ViewFor) {
        if type == .newChallenge {
            titleTextfield?.placeholder = "Type name of challenge"
            titleTextfield?.backgroundColor = UIColor.white
            
            titleLabel?.text = "Name your challenge!"
            titleLabel?.textColor = UIColor.white
            
            nextButton?.setTitle("Next", for: .normal)
            nextButton?.titleLabel?.textColor = UIColor.white
            nextButton?.addTarget(self, action: #selector(self.nextButtonPressed), for: .touchUpInside)
        }
        if type == .response {
            nextButton?.setTitle(challengeTitle!, for: .normal)
            nextButton?.titleLabel?.textColor = UIColor.white
            nextButton?.addTarget(self, action: #selector(self.nextButtonPressed), for: .touchUpInside)
            
            titleLabel?.text = "Responding to:"
            titleLabel?.textColor = UIColor.white

            
            titleTextfield?.isHidden = true
        }
    }
    
    func nextButtonPressed() {
        if let challengeName = self.titleTextfield?.text {
            if !(challengeName.isEmpty) {
                detailsDelegate?.didPressWithDetails(name: challengeName)
            }
            else {
                detailsDelegate?.noDetails()
            }
        }
        else {
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignFirstResponder()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
