//
//  AppDelegate.swift
//  ScrimIT
//
//  Created by Anthony Ma on 21/2/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//


/*
 Set constants for navigation bar height and tab bar height
 
 */

import UIKit
import Firebase

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.width

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let homeFeedIcon = UIImage(named: "ico-teams")
        let trainingIcon = UIImage(named: "ico-training")
        let pathIcon = UIImage(named: "ico-share")
        let userIcon = UIImage(named: "ico-user")
        
        let homeFeed = HomeFeedVC()
        homeFeed.tabBarItem = UITabBarItem(title: "Home", image: homeFeedIcon, tag: 0)
        
        let trainingTab = TrainingVC()
        trainingTab.tabBarItem = UITabBarItem(title: "Training", image: trainingIcon, tag: 1)
        
        let challengesTab = ChallengesVC()
        challengesTab.tabBarItem = UITabBarItem(title: "Challenges", image: pathIcon, tag: 2)
        
        let profileTab = SignUpLogInVC()
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: userIcon, tag: 3)
        
        let homeFeedNavController = NavController(rootViewController: homeFeed)

        let trainingNavController = NavController(rootViewController: trainingTab)
        let pathNavController = NavController(rootViewController: challengesTab)
        let profileNavController = NavController(rootViewController: profileTab)
        
        let dashboard = MyDashboardVC()
        
        let viewControllers = [homeFeedNavController, trainingNavController, pathNavController, profileNavController]
        
        dashboard.viewControllers = viewControllers
        dashboard.tabBar.barTintColor = barTint
        
        window?.rootViewController = dashboard
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

