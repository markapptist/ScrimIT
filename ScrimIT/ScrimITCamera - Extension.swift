//
//  ScrimITCamera - Extension.swift
//  ScrimIT
//
//  Created by Anthony Ma on 29/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension ScrimITCamera {
    
    
    // Call this on the session queue.
    func configureSession() {
        if setupResult != .success {
            return
        }
        
        self.session.beginConfiguration()
        
        /*
         We do not create an AVCaptureMovieFileOutput when setting up the session because the
         AVCaptureMovieFileOutput does not support movie recording with AVCaptureSessionPresetPhoto.
         */
        self.session.sessionPreset = AVCaptureSessionPreset1280x720
        
        // Add video input.
        do {
            var defaultVideoDevice: AVCaptureDevice?
            
            // Choose the back dual camera if available, otherwise default to a wide angle camera.
            if #available(iOS 10.0, *) {
                if let dualCameraDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInDuoCamera, mediaType: AVMediaTypeVideo, position: .back) {
                    defaultVideoDevice = dualCameraDevice
                }
                else if let backCameraDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .back) {
                    // If the back dual camera is not available, default to the back wide angle camera.
                    defaultVideoDevice = backCameraDevice
                }
                else if let frontCameraDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .front) {
                    // In some cases where users break their phones, the back wide angle camera is not available. In this case, we should default to the front wide angle camera.
                    defaultVideoDevice = frontCameraDevice
                }
            } else {
                // Fallback on earlier versions
            }
            
            let videoDeviceInput = try AVCaptureDeviceInput(device: defaultVideoDevice)
            
            if session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
                self.videoDeviceInput = videoDeviceInput
                
                DispatchQueue.main.async {
                    /*
                     Why are we dispatching this to the main queue?
                     Because AVCaptureVideoPreviewLayer is the backing layer for PreviewView and UIView
                     can only be manipulated on the main thread.
                     Note: As an exception to the above rule, it is not necessary to serialize video orientation changes
                     on the AVCaptureVideoPreviewLayer’s connection with other session manipulation.
                     
                     Use the status bar orientation as the initial video orientation. Subsequent orientation changes are
                     handled by CameraViewController.viewWillTransition(to:with:).
                     */
                    //                    let statusBarOrientation = UIApplication.shared.statusBarOrientation
                    let initialVideoOrientation: AVCaptureVideoOrientation = .portrait
                    /*
                     if statusBarOrientation != .unknown {
                     if let videoOrientation = statusBarOrientation.videoOrientation {
                     //                            initialVideoOrientation = videoOrientation
                     }
                     }
                     */
                    self.previewView.videoPreviewLayer.connection.videoOrientation = initialVideoOrientation
                }
            }
            else {
                print("Could not add video device input to the session")
                setupResult = .configurationFailed
                session.commitConfiguration()
                return
            }
        }
        catch {
            print("Could not create video device input: \(error)")
            setupResult = .configurationFailed
            session.commitConfiguration()
            return
        }
        
        // Add audio input.
        do {
            let audioDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio)
            let audioDeviceInput = try AVCaptureDeviceInput(device: audioDevice)
            
            if session.canAddInput(audioDeviceInput) {
                session.addInput(audioDeviceInput)
            }
            else {
                print("Could not add audio device input to the session")
            }
        }
        catch {
            print("Could not create audio device input: \(error)")
        }
        
        // set output file
        sessionQueue.async { [unowned self] in
            let movieFileOutput = AVCaptureMovieFileOutput()
            
            print(self.previewView.frame)
            print(self.previewView.videoPreviewLayer.frame.width)
            print(self.previewView.videoPreviewLayer.frame.height)
            
            let x = self.previewView.videoPreviewLayer.bounds.origin.x/640
            let y = self.previewView.videoPreviewLayer.bounds.origin.y/480
            let width = self.previewView.videoPreviewLayer.bounds.width/640
            let height = self.previewView.videoPreviewLayer.bounds.height/480
            
            let transformed = CGRect(x: x, y: y, width: width, height: height)
            
            movieFileOutput.rectForMetadataOutputRect(ofInterest: transformed)
            
            //            movieFileOutput.rectForMetadataOutputRect(ofInterest: transformed)
            
            //            print(transformed)
            
            // set max duration of recording
            movieFileOutput.maxRecordedDuration = CMTimeMake(10, 1)
            
            self.movieFileOutput = movieFileOutput
            
            if self.session.canAddOutput(movieFileOutput) {
                self.session.beginConfiguration()
                self.session.addOutput(movieFileOutput)
                //self.session.sessionPreset = AVCaptureSessionPresetHigh
                if let connection = movieFileOutput.connection(withMediaType: AVMediaTypeVideo) {
                    if connection.isVideoStabilizationSupported {
                        connection.preferredVideoStabilizationMode = .auto
                    }
                }
                self.session.commitConfiguration()
                
                DispatchQueue.main.async { [unowned self] in
//                    self.recordButton.isEnabled = true
                }
            }
        }
        
        session.commitConfiguration()
    }
    
}
