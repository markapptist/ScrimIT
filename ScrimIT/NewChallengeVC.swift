//
//  NewChallengeVC.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

class NewChallengeVC: UIViewController {
    
    var titleNameLabel: UILabel?
    var titleTextfield: UITextField?
    var start: UIButton?
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.white
        
        titleNameLabel = UILabel(frame: CGRect(x: view.center.x - (view.frame.width * 0.6)/2, y: view.center.y - (view.frame.height * 0.10)/2 - 50, width: view.frame.width * 0.6, height: view.frame.height * 0.10))
        titleNameLabel?.text = "Title for Challenge"
        titleNameLabel?.font = UIFont(name: "Avenir", size: (titleNameLabel?.frame.height)! * 0.4)
        
        titleTextfield = UITextField(frame: CGRect(x: view.center.x - (view.frame.width * 0.6)/2, y: (titleNameLabel?.frame.maxY)!, width: view.frame.width * 0.6, height: view.frame.height * 0.10))
        titleTextfield?.placeholder = "Enter title for challenge"
    
        start = UIButton(type: .system)
        start?.frame = CGRect(x: view.center.x - (view.frame.width * 0.4)/2, y: (titleTextfield?.frame.maxY)!, width: view.frame.width * 0.4, height: view.frame.height * 0.10)
        start?.setTitle("Next", for: .normal)
        start?.addTarget(self, action: #selector(startFunction), for: .touchUpInside)
        
        view.addSubview(titleNameLabel!)
        view.addSubview(titleTextfield!)
        view.addSubview(start!)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        titleTextfield?.text = ""
    }
    
    func startFunction() {
        
        if titleTextfield?.text == nil || titleTextfield?.text == "" {
            self.displayAlert()
        }
        else {
            /*
            let camera = CameraVC()
            camera.challengeTitle = titleTextfield?.text
            camera.cameraFor = .new
            self.navigationController?.pushViewController(camera, animated: true)
            */
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextfield?.resignFirstResponder()
    }
    
    func displayAlert() {
        let alert = UIAlertController(title: "No title", message: "enter a title for challenge", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
