//
//  MyDashboardVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-23.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class MyDashboardVC: UITabBarController, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    enum CameraOverlayType {
        case newChallenge
        case response
    }
    
    var currentOverlay: CameraOverlayType?
    
    var challengeID: String?
    var challengeTitle: String?
    
    var cameraButton: UIButton?
    let cameraIcon = UIImage(named: "ico-camera")
    
    // image picker
    var imagePicker: UIImagePickerController?
    var takenVideoURL: URL?
    
    // activity view
    var activityView: UIActivityIndicatorView?
    
    // challenge video variables
    var newChallengeName: String?
//    var challengeDuration: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.uploadProgress = self
        
        self.delegate = self
        
        // tab bar vc's set up
        
        let homeFeedIcon = UIImage(named: "ico-teams")
        let trainingIcon = UIImage(named: "ico-training")
        let pathIcon = UIImage(named: "ico-share")
        let userIcon = UIImage(named: "ico-user")
        
        let homeFeed = HomeFeedCollectionVC()
        homeFeed.tabBarItem = UITabBarItem(title: "Home", image: homeFeedIcon, tag: 0)
        
        let trainingTab = TrainingVC()
        trainingTab.tabBarItem = UITabBarItem(title: "Training", image: trainingIcon, tag: 1)
        
        let cameraButton = UIViewController()
//        cameraButton.tabBarItem = UITabBarItem(title: "Camera", image: cameraIcon, tag: 2)
        
        let exploreTab = ExploreVC()
        exploreTab.tabBarItem = UITabBarItem(title: "Find", image: pathIcon, tag: 3)
        
        let signedOutTab = SignUpLogInVC()
        signedOutTab.tabBarItem = UITabBarItem(title: "Profile", image: userIcon, tag: 4)
        
        let profileTab = ProfileVC()
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: userIcon, tag: 4)
        
        let homeFeedNavController = NavController(rootViewController: homeFeed)
        
        let trainingNavController = NavController(rootViewController: trainingTab)
        let pathNavController = NavController(rootViewController: exploreTab)
        let profileNavController = NavController(rootViewController: profileTab)
        let signedOutNavController = NavController(rootViewController: signedOutTab)
        
        
        var viewControllers = [UIViewController]()
        
        if(userDefaults.bool(forKey: "userLoggedIn")) {
            viewControllers = [homeFeedNavController, trainingNavController, cameraButton, pathNavController, profileNavController]
        }
        
        if(!userDefaults.bool(forKey: "userLoggedIn")) {
            viewControllers = [homeFeedNavController, trainingNavController, cameraButton, pathNavController, signedOutNavController]
        }
        
        self.viewControllers = viewControllers
        self.tabBar.barTintColor = barTint
        
        // set up camera button
        self.setUpCameraButton()
    }
    
    // Tab bar delegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch viewController {
        case is NavController:
            self.cameraButton?.isHidden = false
        default:
            self.cameraButton?.isHidden = true
        }
    }
    
    func setUpCameraButton() {
        cameraButton = UIButton()
        self.view.addSubview(cameraButton!)
        cameraButton?.translatesAutoresizingMaskIntoConstraints = false
        cameraButton?.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor, constant: 0).isActive = true
        cameraButton?.centerYAnchor.constraint(equalTo: self.tabBar.centerYAnchor, constant: 0).isActive = true
        cameraButton?.widthAnchor.constraint(equalTo: self.tabBar.widthAnchor, multiplier: 0.20)
        cameraButton?.heightAnchor.constraint(equalTo: self.tabBar.heightAnchor, multiplier: 1.0)
        cameraButton?.setImage(#imageLiteral(resourceName: "ico-camera.png"), for: .normal)
        cameraButton?.addTarget(self, action: #selector(self.bringUpCamera), for: .touchUpInside)
        
        self.view.bringSubview(toFront: cameraButton!)
        self.view.layoutIfNeeded()
        
    }
    

}
