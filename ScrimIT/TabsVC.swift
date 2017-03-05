//
//  TabsVC.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-02-24.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class TabsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        let lightGreen = Tile(frame: CGRect(x: 0.0, y: self.view.frame.maxY - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        lightGreen.setColour(colour: UIColor.init(red: 87/255, green: 123/255, blue: 54/255, alpha: 0.8))
        
        let darkGreen = Tile(frame: CGRect(x: 0.0, y: lightGreen.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        darkGreen.setColour(colour: UIColor.init(red: 82/255, green: 121/255, blue: 42/255, alpha: 0.8))
        
        let lightGreen2 = Tile(frame: CGRect(x: 0.0, y: darkGreen.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        lightGreen2.setColour(colour: UIColor.init(red: 87/255, green: 123/255, blue: 54/255, alpha: 0.8))
        
        let darkGreen2 = Tile(frame: CGRect(x: 0.0, y: lightGreen2.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        darkGreen2.setColour(colour: UIColor.init(red: 82/255, green: 121/255, blue: 42/255, alpha: 0.8))
        
        let lightGreen3 = Tile(frame: CGRect(x: 0.0, y: darkGreen2.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        lightGreen3.setColour(colour: UIColor.init(red: 87/255, green: 123/255, blue: 54/255, alpha: 0.8))
        
        let darkGreen3 = Tile(frame: CGRect(x: 0.0, y: lightGreen3.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        darkGreen3.setColour(colour: UIColor.init(red: 82/255, green: 121/255, blue: 42/255, alpha: 0.8))
        
        let lightGreen4 = Tile(frame: CGRect(x: 0.0, y: darkGreen3.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        lightGreen4.setColour(colour: UIColor.init(red: 87/255, green: 123/255, blue: 54/255, alpha: 0.8))
        
        let darkGreen4 = Tile(frame: CGRect(x: 0.0, y: lightGreen4.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        darkGreen4.setColour(colour: UIColor.init(red: 82/255, green: 121/255, blue: 42/255, alpha: 0.8))
        
        let lightGreen5 = Tile(frame: CGRect(x: 0.0, y: darkGreen4.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        lightGreen5.setColour(colour: UIColor.init(red: 87/255, green: 123/255, blue: 54/255, alpha: 0.8))
        
        let darkGreen6 = Tile(frame: CGRect(x: 0.0, y: lightGreen5.frame.origin.y - screenHeight/6, width: screenWidth, height: screenHeight/6))
        
        darkGreen6.setColour(colour: UIColor.init(red: 82/255, green: 121/255, blue: 42/255, alpha: 0.8))
        
        let tiles:[Tile] = [lightGreen, darkGreen, lightGreen2, darkGreen2, lightGreen3, darkGreen3, lightGreen4, darkGreen4, lightGreen5, darkGreen6]
        
        for tile in tiles {
            view.addSubview(tile)
        }
        
    }
    
    func showActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    func hideActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
