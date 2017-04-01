//
//  ScrimITCamera.swift
//  ScrimIT
//
//  Created by Anthony Ma on 29/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class ScrimITCamera: UIViewController {
    
    enum SessionSetupResult {
        case success
        case notAuthorized
        case configurationFailed
    }
    
    // device
    var videoDeviceInput: AVCaptureDeviceInput!
    
    // session
    var session = AVCaptureSession()
    
    // video layer
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    // output
    var movieFileOutput: AVCaptureFileOutput?
    
    var previewView = PreviewView()
    
    // configuration items
    var setupResult: SessionSetupResult?
    let sessionQueue = DispatchQueue(label: "session queue", attributes: [], target: nil) // session queue 
    
    override func viewDidLoad() {
        
        // Set up the video preview view.
        previewView.session = session
        
        /*
         Check video authorization status. Video access is required and audio
         access is optional. If audio access is denied, audio is not recorded
         during movie recording.
         */
        switch AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) {
        case .authorized:
            // The user has previously granted access to the camera.
            break
            
        case .notDetermined:
            /*
             The user has not yet been presented with the option to grant
             video access. We suspend the session queue to delay session
             setup until the access request has completed.
             
             Note that audio access will be implicitly requested when we
             create an AVCaptureDeviceInput for audio during session setup.
             */
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { [unowned self] granted in
                if !granted {
                    self.setupResult = .notAuthorized
                }
                self.sessionQueue.resume()
            })
            
        default:
            // The user has previously denied access.
            setupResult = .notAuthorized
        }
        
        // configure camera session
        self.configureSession()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        
        previewLayer.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height/2)
        
        self.view.layer.addSublayer(previewLayer)
        
    }
    
}
