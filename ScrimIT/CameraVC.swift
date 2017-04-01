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
    func setPreviewFrame(width: CGFloat, height: CGFloat)
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
        
        _previewView = previewView
        videoDelegate = self
        
        // camera variables
        videoLayer = AVCaptureVideoPreviewLayer()
        previewView.videoPreviewLayer = videoLayer
        
        super.viewDidLoad()
        
//        (self.navigationController?.navigationBar.frame.maxY)!
        
//        let orientation = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(orientation, forKey: "orientation")
        
        self.previewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: (3*self.view.frame.size.width)/4)
        
        previewView.backgroundColor = UIColor.black
        previewView.videoPreviewLayer.frame = previewView.frame
//            CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: previewView.frame.width, height: previewView.frame.height)
        print(previewView.videoPreviewLayer.frame)
//        previewView.videoPreviewLayer.position = CGPoint(x: 0, y: 0)
        previewView.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        previewView.videoPreviewLayer.session = previewView.session
        previewView.layer.addSublayer(videoLayer)
        
        /*
        let remainingView = UIView(frame: CGRect(x: 0, y: self.previewView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)! - self.previewView.frame.height - 20))
        remainingView.backgroundColor = UIColor.green
 
        cameraRecord = UIButton(type: .system)
        cameraRecord.frame = CGRect(x: self.view.frame.midX - ((view.frame.width*0.20)/2), y: self.view.frame.maxY - view.frame.width * 0.20, width: self.view.frame.width * 0.20, height: self.view.frame.width * 0.20)
//        cameraRecord.frame = CGRect(x: remainingView.bounds.midX - ((view.frame.width*0.20)/2), y: remainingView.bounds.maxY - view.frame.width * 0.20, width: remainingView.frame.width * 0.20, height: remainingView.frame.width * 0.20)
        cameraRecord.backgroundColor = UIColor.white
        cameraRecord.layer.cornerRadius = cameraRecord.frame.width/2
        cameraRecord.backgroundColor = UIColor.clear
        cameraRecord.layer.borderColor = UIColor.white.cgColor
        cameraRecord.layer.borderWidth = 3.0
        cameraRecord.addTarget(self, action: #selector(recordFunction), for: .touchUpInside)
        */
//        self.view.addSubview(cameraRecord)
 
        /*
         self.view.addSubview(remainingView)
         remainingView.addSubview(cameraRecord)
 
        print(cameraRecord.frame)
 
        remainingView.bringSubview(toFront: cameraRecord)
        */
        self.view.addSubview(previewView)
    }
    
    override func viewWillLayoutSubviews() {
        
        
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
    
    internal func setPreviewFrame(width: CGFloat, height: CGFloat) {
        let newHeight = (9 * width)/16
        
        self.previewView.frame = CGRect(x: 0, y: 0, width: width, height: newHeight)
    }
    
}

