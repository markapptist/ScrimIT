//
//  NavController.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-01.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

let barTint = UIColor.init(red: 73/255, green: 82/255, blue: 62/255, alpha: 1.0)

protocol tabPressed {
    func homeTabPressed()
    func trainingTabPressed()
    func challengesTabPressed()
    func profileTabPressed()
}

class NavController: UINavigationController, UINavigationControllerDelegate {
    
    var titleImageView: UIImageView?
    var titleImg: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navBarDelegate = self 
                
        let titleImgWidth = self.navigationBar.frame.width/9
        let titleImgHeight = self.navigationBar.frame.height * 0.6

        
        self.titleImageView = UIImageView()
        

        
        self.pushViewController(MyDashboardVC(), animated: true)
        
        self.navigationBar.barTintColor = barTint
        self.navigationBar.addSubview(self.titleImageView!)
        self.titleImg = UIImage(named: "soccerball")
        self.titleImageView?.image = self.titleImg
        
        self.titleImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.titleImageView?.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor).isActive = true
        self.titleImageView?.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor).isActive = true
        self.titleImageView?.widthAnchor.constraint(equalToConstant: titleImgWidth).isActive = true
        self.titleImageView?.heightAnchor.constraint(equalToConstant: titleImgHeight).isActive = true
        
        self.titleImageView?.contentMode = .scaleAspectFit
   
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


extension NavController: tabPressed {
    
    func homeTabPressed() {
        print("home pressed")
    }
    
    func trainingTabPressed() {
        print("training pressed")
    }
    
    func challengesTabPressed() {
        print("challenges pressed")
    }
    
    func profileTabPressed() {
        print("profile pressed")
    }
    
}
