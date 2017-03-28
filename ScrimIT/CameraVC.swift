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

@available(iOS 10.0, *)
class CameraVC: Camera {
    
    var cameraFor: VideoType?
    
    // response video unique ID
    var responseToVideoID: String?
    var challengeTitle: String?
    var videoURL: URL?
    
    // view variables 
    var cameraRecord: UIButton!
    
//    var timeBarView = UIView()
    var activityView: UIActivityIndicatorView?
    
    var previewView = PreviewView()
    
    var videoLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        
        // camera variables
        videoLayer = AVCaptureVideoPreviewLayer()
        previewView.videoPreviewLayer = videoLayer
        
        _previewView = previewView
        videoDelegate = self
        
        super.viewDidLoad()
        
        previewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        previewView.backgroundColor = UIColor.black
        previewView.videoPreviewLayer.frame = CGRect(x: 0, y: 0, width: previewView.bounds.width, height: previewView.bounds.height/2)
        print(_previewView.videoPreviewLayer.frame)
        previewView.videoPreviewLayer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        previewView.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        previewView.videoPreviewLayer.session = previewView.session
        previewView.layer.addSublayer(videoLayer)
        
        cameraRecord = UIButton(type: .system)
        cameraRecord.frame = CGRect(x: view.center.x - ((view.frame.width*0.20)/2), y: view.frame.maxY - view.frame.width * 0.20, width: view.frame.width * 0.20, height: view.frame.width * 0.20)
        cameraRecord.backgroundColor = UIColor.white
        cameraRecord.layer.cornerRadius = cameraRecord.frame.width/2
        cameraRecord.backgroundColor = UIColor.clear
        cameraRecord.layer.borderColor = UIColor.white.cgColor
        cameraRecord.layer.borderWidth = 3.0
        cameraRecord.addTarget(self, action: #selector(recordFunction), for: .touchUpInside)
        
        self.view.addSubview(previewView)
        
        self.view.addSubview(cameraRecord)
    }
    
    override func viewWillLayoutSubviews() {
        
        
        self.view.bringSubview(toFront: cameraRecord)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
    
    func displayPosted() {
        let alert = UIAlertController(title: "Posted!", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorUploading(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }


    
    func showActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    func hideActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }


}

@available(iOS 10.0, *)
extension CameraVC: VideoUploadDelegate {
    internal func recordingStarted() {
        UIView.animate(withDuration: 0.5) { 
            self.cameraRecord.backgroundColor = UIColor.white
            self.cameraRecord.setTitle("STOP", for: .normal)
            self.cameraRecord.titleLabel?.font = UIFont(name: "Avenir", size: self.cameraRecord.frame.height * 0.3)
            
        }
        self.navigationController?.navigationBar.isHidden = true
    }

    internal func recordingStopped(video: URL) {
        
        UIView.animate(withDuration: 0.5) { 
            self.cameraRecord.setTitle("", for: .normal)
            self.cameraRecord.backgroundColor = UIColor.clear
        }
        
        self.videoURL = video
        self.navigationController?.navigationBar.isHidden = false
        /*
        let player = AuthService.instance.getSignedInUser()
        if player.uid == nil {
            self.displayAlert()
        }
        else {
            
         }
        */
        if cameraFor == .new {
            let videoStorageName = "\(NSUUID().uuidString)\(self.videoURL)"
            DataService.instance.uploadProgress = self
            DataService.instance.saveChallengeVideo(file: video, name: self.challengeTitle!, videoName: videoStorageName)
        }
        if cameraFor == .response {
            let videoStorageName = "\(NSUUID().uuidString)\(self.videoURL)"
            DataService.instance.uploadProgress = self
            DataService.instance.saveResponseToChallenge(name: self.challengeTitle!, videoName: videoStorageName, file: video, videoID: self.responseToVideoID!)
        }
    }
    
    internal func videoPosted() {
        
    }
    
}

