//
//  ChallengesVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-04-01.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class ChallengesVC: TabsVC {
    
    let scrollView = UIScrollView()
    
    var challengeType = 0
    
    var challenge1 = UIView()
    var challenge2 = UIView()
    var challenge3 = UIView()
    var challenge4 = UIView()
    var challenge5 = UIView()
    var challenge6 = UIView()
    var challenge7 = UIView()
    var challenge8 = UIView()
    var challenge9 = UIView()
    var challenge10 = UIView()

    let titleLabel = UILabel()
    
    init(type: Int) {

        self.challengeType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(self.challengeType == 0){
            titleLabel.text = "Ball Control"
        }
        
        if(self.challengeType == 1){
            titleLabel.text = "Juggling"
        }
        
        if(self.challengeType == 2){
            titleLabel.text = "Passing"
        }
        
        if(self.challengeType == 3){
            titleLabel.text = "Set Pieces"
        }
        
        if(self.challengeType == 4){
            titleLabel.text = "Shooting"
        }
        
        if(self.challengeType == 5){
            titleLabel.text = "Agility"
        }
        
        if(self.challengeType == 6){
            titleLabel.text = "Jumping"
        }
        
        if(self.challengeType == 7){
            titleLabel.text = "Social Videos"
        }
        
        if(self.challengeType == 8){
            titleLabel.text = "Volleys"
        }
        
        titleLabel.font = UIFont(name: "MyriadPro-BoldCond", size: 30.0)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 5.3)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        challenge1 = addChallengeView(title: "Challenge 1", anchor: scrollView.topAnchor)
        challenge2 = addChallengeView(title: "Challenge 2", anchor: challenge1.bottomAnchor)
        challenge3 = addChallengeView(title: "Challenge 3", anchor: challenge2.bottomAnchor)
        challenge4 = addChallengeView(title: "Challenge 4", anchor: challenge3.bottomAnchor)
        challenge5 = addChallengeView(title: "Challenge 5", anchor: challenge4.bottomAnchor)
        challenge6 = addChallengeView(title: "Challenge 6", anchor: challenge5.bottomAnchor)
        challenge7 = addChallengeView(title: "Challenge 7", anchor: challenge6.bottomAnchor)
        challenge8 = addChallengeView(title: "Challenge 8", anchor: challenge7.bottomAnchor)
        challenge9 = addChallengeView(title: "Challenge 9", anchor: challenge8.bottomAnchor)
        challenge10 = addChallengeView(title: "Challenge 10", anchor: challenge9.bottomAnchor)


        
    }
    
    func addChallengeView(title:String, anchor: NSLayoutYAxisAnchor) -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 8
        view.alpha = 0.7
        
        self.scrollView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: anchor, constant: 10).isActive = true
        view.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 0).isActive = true
        view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.9).isActive = true
        view.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.6).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "MyriadPro-BoldCond", size: 20)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        return view
        
        
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
