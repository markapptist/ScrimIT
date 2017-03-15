//
//  TrainingVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class TrainingVC: TabsVC {
    
    let fieldView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldView.makeRound()
        
        self.view.addSubview(fieldView)
        
        fieldView.backgroundColor = UIColor.clear
        fieldView.layer.borderColor = UIColor.white.cgColor
        fieldView.layer.borderWidth = 2.0
        fieldView.translatesAutoresizingMaskIntoConstraints = false

        fieldView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        fieldView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -20).isActive = true
        fieldView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        fieldView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
    }
    
 

}
