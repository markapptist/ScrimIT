//
//  ChallengesVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class ExploreVC: TabsVC, UISearchBarDelegate {
    
    let fieldView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let searchBar = UISearchBar()

    
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

        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.delegate = self
    
        self.view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        searchBar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        searchBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true 
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    

}
