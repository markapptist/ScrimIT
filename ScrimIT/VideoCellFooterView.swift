//
//  VideoCellFooterView.swift
//  ScrimIT
//
//  Created by Anthony Ma on 26/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class VideoCellFooterView: UIView {
    
    enum FooterPlacement {
        case top
        case bottom
    }
    
    var submissionLabel: UILabel?
    var scrimITButton: ScrimITButton?
    var submissionsButton: ScrimITButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
    }
    
    func setFooterPlacement(footer: FooterPlacement) {
        if footer == .top {
            // label
            submissionLabel = UILabel()
            submissionLabel?.text = "Submissions"
            submissionLabel?.textColor = UIColor.white
            self.addSubview(submissionLabel!)
            submissionLabel?.translatesAutoresizingMaskIntoConstraints = false
            submissionLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
            submissionLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            submissionLabel?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7, constant: -10).isActive = true
            submissionLabel?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            
            // button
            scrimITButton = ScrimITButton()
            scrimITButton?.setButtonTitle(buttonTitle: .scrimIT)
            self.addSubview(scrimITButton!)
            scrimITButton?.translatesAutoresizingMaskIntoConstraints = false
            scrimITButton?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
            scrimITButton?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            scrimITButton?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30).isActive = true
            scrimITButton?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55).isActive = true
        }
        if footer == .bottom {
            // recent submissions
            submissionsButton = ScrimITButton()
            submissionsButton?.setButtonTitle(buttonTitle: .submission)
            self.addSubview(submissionsButton!)
            submissionsButton?.translatesAutoresizingMaskIntoConstraints = false
            submissionsButton?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            submissionsButton?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            submissionsButton?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
            submissionsButton?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.70).isActive = true

        }
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
