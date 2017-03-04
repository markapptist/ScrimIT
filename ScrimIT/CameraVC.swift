//
//  CameraVC.swift
//  ScrimIT
//
//  Created by Anthony Ma on 1/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import AVFoundation

protocol VideoUploadDelegate {
    func videoPosted()
    func recordingStopped(video: URL)
    func recordingStarted()
}

enum VideoType {
    case new
    case response
}

class CameraVC: Camera {
    
    var cameraFor: VideoType?
    
    var reponseToName: String?
    
    var responseTo: String?
    
    var challengeTitle: String?
    
    var redDot: UILabel?
    
    var cameraRecord: RecordButton!
    
    var videoURL: URL?
    
    var _previewView = PreviewView()
    
    override func viewDidLoad() {
        previewView = _previewView
        
        self.tabBarController?.tabBar.isHidden = true
        
        previewView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height)
        
        videoDelegate = self
        
        super.viewDidLoad()
        
        previewView.backgroundColor = UIColor.black
        
        cameraRecord = RecordButton(frame: CGRect(x: view.center.x - ((view.frame.width*0.20)/2), y: view.frame.maxY - view.frame.width * 0.20, width: view.frame.width * 0.20, height: view.frame.width * 0.20))
        cameraRecord.backgroundColor = UIColor.white
        cameraRecord.addTarget(self, action: #selector(self.recordFunction), for: .touchUpInside)
        
        self.view.addSubview(previewView)
        self.view.addSubview(cameraRecord)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        view.bringSubview(toFront: cameraRecord)
    }
    
    // push button to record
    func recordFunction() {
        self.toggleMovieRecording()
    }
    
    func displayAlert() {
        let alert = UIAlertController(title: "No one signed in", message: "Signup/Signin", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

}

extension CameraVC: VideoUploadDelegate {
    internal func recordingStarted() {
        redDot = UILabel(frame: CGRect(x: (self.navigationController?.navigationBar.bounds.maxX)! - 20 - (view.frame.width * 0.10), y: (self.navigationController?.navigationBar.bounds.minY)! + 20, width: view.frame.width * 0.10, height: (self.navigationController?.navigationBar.frame.height)! - 20))
        redDot?.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.addSubview(redDot!)
    }

    internal func recordingStopped(video: URL) {
        self.redDot?.removeFromSuperview()
        self.videoURL = video
        let player = AuthService.instance.getSignedInUser()
        if player.uid == nil {
            self.displayAlert()
        }
        else {
            if cameraFor == .new {
                let videoStorageName = "\(NSUUID().uuidString)\(self.videoURL)"
                DataService.instance.saveChallengeVideo(file: video, title: self.challengeTitle!, user: player.uid!, userEmail: player.email!, videoName: videoStorageName)
            }
            if cameraFor == .response {
                let videoStorageName = "\(NSUUID().uuidString)\(self.videoURL)"
                DataService.instance.saveResponseToChallenge(name: self.challengeTitle!, userEmail: player.email!, videoName: videoStorageName, file: video)
            }
        }
    }
    
    internal func videoPosted() {
        
    }

    
}

