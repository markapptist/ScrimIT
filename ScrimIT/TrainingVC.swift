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
    
    let scrollView = UIScrollView()
    
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
        
        let level1Btn = CircleButton(frame: CGRect(x: self.fieldView.center.x, y: self.fieldView.center.y, width: 50, height: 50))
        
        level1Btn.setColourWhite()
        level1Btn.addBorder()
        level1Btn.addText(string: "1", color: 0)
        level1Btn.animateRadius(scale: 1.2, soundOn: false)
        fieldView.addSubview(level1Btn)
        
        level1Btn.translatesAutoresizingMaskIntoConstraints = false
        level1Btn.bottomAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: -20).isActive = true
        level1Btn.centerXAnchor.constraint(equalTo: fieldView.centerXAnchor, constant: 0).isActive = true
        level1Btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        level1Btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        level1Btn.addTarget(self, action: #selector(self.onLevelTap), for: .touchUpInside)
        
        let level2Btn = CircleButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        
        level2Btn.setColourWhite()
        level2Btn.addBorder()
        level2Btn.addText(string: "2", color: 0)
        level2Btn.animateRadius(scale: 1.2, soundOn: false)
        fieldView.addSubview(level2Btn)
        
        level2Btn.translatesAutoresizingMaskIntoConstraints = false
        level2Btn.bottomAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: -150).isActive = true
        level2Btn.centerXAnchor.constraint(equalTo: fieldView.centerXAnchor, constant: 100).isActive = true
        level2Btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        level2Btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        level2Btn.addTarget(self, action: #selector(self.onLevelTap), for: .touchUpInside)
        
        let level3Btn = CircleButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        
        level3Btn.setColourWhite()
        level3Btn.addBorder()
        level3Btn.addText(string: "3", color: 0)
        level3Btn.animateRadius(scale: 1.2, soundOn: false)
        fieldView.addSubview(level3Btn)
        
        level3Btn.translatesAutoresizingMaskIntoConstraints = false
        level3Btn.bottomAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: -150).isActive = true
        level3Btn.centerXAnchor.constraint(equalTo: fieldView.centerXAnchor, constant: -100).isActive = true
        level3Btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        level3Btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        level3Btn.addTarget(self, action: #selector(self.onLevelTap), for: .touchUpInside)
        
        let path = Path(origin: level1Btn.center)
   //     self.fieldView.addSubview(path)

        
        self.view.addSubview(scrollView)
        scrollView.isHidden = true 
    
    }
    
    func onLevelTap() {
        
     
            
            scrollView.isHidden = false
            scrollView.backgroundColor = UIColor.lightGray
            scrollView.alpha = 0.7
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.isScrollEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.contentSize = CGSize(width: self.view.frame.width * 3.0, height: self.view.frame.height * 0.2)
            scrollView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: 0).isActive = true
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        let challenge1 = ChallengeBox()
        challenge1.setColorRed()
        scrollView.addSubview(challenge1)
        challenge1.translatesAutoresizingMaskIntoConstraints = false
        challenge1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        challenge1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge1.label.text = "Ball Control"
        challenge1.completedLbl.text = "0/10"
        challenge1.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge2 = ChallengeBox()
        challenge2.setColorRed()
        scrollView.addSubview(challenge2)
        challenge2.translatesAutoresizingMaskIntoConstraints = false
        challenge2.leadingAnchor.constraint(equalTo: challenge1.trailingAnchor, constant: 10).isActive = true
        challenge2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge2.label.text = "Juggling"
        challenge2.completedLbl.text = "0/10"
        challenge2.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge3 = ChallengeBox()
        challenge3.setColorRed()
        scrollView.addSubview(challenge3)
        challenge3.translatesAutoresizingMaskIntoConstraints = false
        challenge3.leadingAnchor.constraint(equalTo: challenge2.trailingAnchor, constant: 10).isActive = true
        challenge3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge3.label.text = "Passing"
        challenge3.completedLbl.text = "0/10"
        challenge3.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge4 = ChallengeBox()
        challenge4.setColorRed()
        scrollView.addSubview(challenge4)
        challenge4.translatesAutoresizingMaskIntoConstraints = false
        challenge4.leadingAnchor.constraint(equalTo: challenge3.trailingAnchor, constant: 10).isActive = true
        challenge4.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge4.label.text = "Set Pieces"
        challenge4.completedLbl.text = "0/10"
        challenge4.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge5 = ChallengeBox()
        challenge5.setColorRed()
        scrollView.addSubview(challenge5)
        challenge5.translatesAutoresizingMaskIntoConstraints = false
        challenge5.leadingAnchor.constraint(equalTo: challenge4.trailingAnchor, constant: 10).isActive = true
        challenge5.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge5.label.text = "Shooting"
        challenge5.completedLbl.text = "0/10"
        challenge5.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge6 = ChallengeBox()
        challenge6.setColorRed()
        scrollView.addSubview(challenge6)
        challenge6.translatesAutoresizingMaskIntoConstraints = false
        challenge6.leadingAnchor.constraint(equalTo: challenge5.trailingAnchor, constant: 10).isActive = true
        challenge6.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge6.label.text = "Agility"
        challenge6.completedLbl.text = "0/10"
        challenge6.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge7 = ChallengeBox()
        challenge7.setColorRed()
        scrollView.addSubview(challenge7)
        challenge7.translatesAutoresizingMaskIntoConstraints = false
        challenge7.leadingAnchor.constraint(equalTo: challenge6.trailingAnchor, constant: 10).isActive = true
        challenge7.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge7.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge7.label.text = "Jumping"
        challenge7.completedLbl.text = "0/10"
        challenge7.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge8 = ChallengeBox()
        challenge8.setColorRed()
        scrollView.addSubview(challenge8)
        challenge8.translatesAutoresizingMaskIntoConstraints = false
        challenge8.leadingAnchor.constraint(equalTo: challenge7.trailingAnchor, constant: 10).isActive = true
        challenge8.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge8.label.text = "Social Videos"
        challenge8.completedLbl.text = "0/10"
        challenge8.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
        let challenge9 = ChallengeBox()
        challenge9.setColorRed()
        scrollView.addSubview(challenge9)
        challenge9.translatesAutoresizingMaskIntoConstraints = false
        challenge9.leadingAnchor.constraint(equalTo: challenge8.trailingAnchor, constant: 10).isActive = true
        challenge9.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        challenge9.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7).isActive = true
        challenge9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        challenge9.label.text = "Volleys"
        challenge9.completedLbl.text = "0/10"
        challenge9.addTarget(self, action: #selector(challengeBtnPressed), for: .touchUpInside)
        
    }
    
    func challengeBtnPressed() {
        let vc = ChallengesVC(type: 0)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(scrollView.isHidden == false) {
            scrollView.isHidden = true
        }
    }
    
 

}
