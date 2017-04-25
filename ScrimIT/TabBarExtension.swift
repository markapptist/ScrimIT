//
//  TabBarExtension.swift
//  ScrimIT
//
//  Created by Anthony Ma on 11/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import CoreMedia

extension MyDashboardVC: SetVideoDetails, UploadProgressDelegate {
    
    // upload progress delegate
    func showActivityView() {
        self.activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.activityView?.frame = self.view.frame
        self.view.addSubview(activityView!)
        self.activityView?.hidesWhenStopped = true
        self.activityView?.startAnimating()
    }
    
    func removeActivityView() {
        self.activityView?.stopAnimating()
        // remove saved video
        self.removeImage(itemName: self.newChallengeName!, fileExtension: "mov")
    }
    
    func errorUploading(error: Error) {
        
    }
    
    // set video details
    func didPressWithDetails(name: String) {
        imagePicker?.cameraOverlayView?.removeFromSuperview()
        self.newChallengeName = name
    }
    
    func noDetails() {
        
    }
    
    func bringUpCamera() {
        
        // image Picker create
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = .camera
            imagePicker?.cameraDevice = .rear
            imagePicker?.mediaTypes = [kUTTypeMovie as String]
//            imagePicker?.allowsEditing = true
            imagePicker?.videoQuality = .type640x480
            imagePicker?.videoMaximumDuration = 3
            
            let newChallengeView = NewChallengeView(frame: self.view.frame)
            newChallengeView.detailsDelegate = self
            imagePicker?.cameraOverlayView = newChallengeView
            imagePicker?.view.bringSubview(toFront: newChallengeView)
            
            print(imagePicker?.videoQuality)
            
            var t = CGAffineTransform.identity
            t = t.translatedBy(x: 0, y: 50)
            //            t = t.rotated(by: CGFloat.pi/2)
            imagePicker?.cameraViewTransform = t
            
            print(imagePicker?.view.frame)
            print(imagePicker?.view.layer.frame)
            
            //            imagePicker?.cameraOverlayView = OverlayView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imagePicker?.modalPresentationStyle = .overCurrentContext
            
            self.present(imagePicker!, animated: true, completion: {
                self.tabBarController?.tabBar.isHidden = true
            })
        }
        else {
            
        }
        
    }
    
    // Remove Saved File
    func removeImage(itemName:String, fileExtension: String) {
        let fileManager = FileManager.default
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        guard let dirPath = paths.first else {
            return
        }
        let filePath = "\(dirPath)/\(itemName).\(fileExtension)"
        do {
            try fileManager.removeItem(atPath: filePath)
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismiss(animated: true, completion: {
            self.saveToDocumentsDir(url: self.takenVideoURL!)
        })
        
        // Handle a movie capture
        if mediaType == kUTTypeMovie {
            
            //        let mutableCompositionAudio = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
            
            let videoPathURL = info[UIImagePickerControllerMediaURL] as! URL
            
            self.takenVideoURL = videoPathURL
            // create instructions
            //        let mutableVideoCompositionInstructions = AVMutableVideoCompositionInstruction()
            //        mutableVideoCompositionInstructions.timeRange = CMTimeRange(start: kCMTimeZero, duration: mutableComposition.duration)
            
            //        assetLayerInstructions.setCropRectangle(self.previewLayer.bounds, at: kCMTimeZero)
            
            //        let transform1 = CGAffineTransform(translationX: 0, y: 50)
            //        print(transform1.a)
            //        print(transform1.b)
            //        print(transform1.c)
            //        print(transform1.d)
            //        print(transform1.tx)
            //        print(transform1.ty)
            //        let transform2 = transform1.rotated(by: CGFloat.pi/2)
            //        let transform3 = transform2.scaledBy(x: 1/1920, y: 1/1080)
            //        let finalTransform = transform3
            //         assetLayerInstructions.setTransform(finalTransform, at: kCMTimeZero)
            
            
            /*
             let transform1 = CGAffineTransform(rotationAngle: CGFloat.pi/2)
             assetLayerInstructions.setTransform(transform1, at: kCMTimeZero)
             */
            
            //            var t = CGAffineTransform.identity
            //            t = t.translatedBy(x: 0, y: 50)
            //            t = t.rotated(by: CGFloat.pi/2)
            /*
             t.a = 0
             t.c = 1.0
             t.tx = 1.0
             t = t.scaledBy(x: 0, y: (1920/1080))
             */
            
            //        assetLayerInstructions.setTransform(finalTransform, at: kCMTimeZero)
            
            //            assetLayerInstructions.setTransform(t, at: kCMTimeZero)
            
            /*
             print(self.imagePicker?.view.frame)
             let videoPathURL = info[UIImagePickerControllerMediaURL] as! URL
             
             let asset = AVAsset(url: videoPathURL)
             
             if !asset.isComposable {
             
             }
             guard let path = (info[UIImagePickerControllerMediaURL] as! NSURL).path else { return }
             if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path) {
             UISaveVideoAtPathToSavedPhotosAlbum(path, self, #selector(self.video(videoPath:didFinishSavingWithError:contextInfo:)), nil)
             }
             */
        }
    }
    
    // save to documents directory
    func saveToDocumentsDir(url: URL) {
        
        // create mutable composition
        let mutableComposition = AVMutableComposition()
        
        let mutableCompositionVideo = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        // video asset
        let videoAsset: AVAsset = AVAsset(url: url)
        
        // video asset track
        let videoAssetTrack = videoAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
        
        do {
            let timeRange = CMTimeRange(start: kCMTimeZero, duration: videoAssetTrack.timeRange.duration)
            try mutableCompositionVideo.insertTimeRange(timeRange, of: videoAssetTrack, at: kCMTimeZero)
        } catch {
            
        }
        
        // video asset instructions
        let assetVideoInstructions = AVMutableVideoCompositionInstruction()
        
        assetVideoInstructions.timeRange = CMTimeRange(start: kCMTimeZero, duration: videoAssetTrack.timeRange.duration)
        
        // video asset layer instructions
        let assetLayerInstructions = AVMutableVideoCompositionLayerInstruction(assetTrack: mutableCompositionVideo)
        
        assetLayerInstructions.setOpacityRamp(fromStartOpacity: 1.0, toEndOpacity: 0.0, timeRange: videoAssetTrack.timeRange)
        
        // transforms
        
        var videoTransform = videoAssetTrack.preferredTransform
        
        if UIDevice.current.orientation.isLandscape {
            
        }
        
        if UIDevice.current.orientation.isPortrait {
            videoTransform.a = 0.0
            videoTransform.b = 1.0
            videoTransform.c = -1.0
            videoTransform.d = 0
        }
        
        
        let translate = CGAffineTransform(translationX: 0, y: 0)
        
        var firstAssesScaleToFitRatio = 640 / videoAssetTrack.naturalSize.width
        
        // portrait
        firstAssesScaleToFitRatio = 640 / videoAssetTrack.naturalSize.height
        let scaleFactor = CGAffineTransform(scaleX: firstAssesScaleToFitRatio, y: firstAssesScaleToFitRatio)
        
        assetLayerInstructions.setTransform(videoTransform.concatenating(scaleFactor).concatenating(translate), at: kCMTimeZero)
        
        //        assetLayerInstructions.setTransform(transform, at: kCMTimeZero)
        
        assetVideoInstructions.layerInstructions = [assetLayerInstructions]
        
        let mutableVideoComposition = AVMutableVideoComposition()
        mutableVideoComposition.instructions = [assetVideoInstructions]
        
        //        mutableVideoComposition.renderSize = CGSize(width: self.previewView.videoPreviewLayer.bounds.width, height: self.previewView.videoPreviewLayer.bounds.height)
        
        print(videoAssetTrack.naturalSize)
        
        mutableVideoComposition.renderSize = CGSize(width: videoAssetTrack.naturalSize.width, height: videoAssetTrack.naturalSize.height)
        mutableVideoComposition.frameDuration = CMTimeMake(1, Int32(videoAssetTrack.nominalFrameRate))
        
        let manager = FileManager()
        
        do {
            let documentDirectory = try manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) as URL
            
            print(documentDirectory)
            
            let finalURL: URL = documentDirectory.appendingPathComponent(self.newChallengeName!)
            let finalOutputURL: URL = finalURL.appendingPathExtension("mov")
            
            let export = AVAssetExportSession(asset: videoAsset, presetName: AVAssetExportPreset640x480)
            export?.outputURL = finalOutputURL
            export?.videoComposition = mutableVideoComposition
            export?.outputFileType = AVFileTypeQuickTimeMovie
            export?.timeRange = CMTimeRange(start: kCMTimeZero, duration: videoAsset.duration)
            
            export?.exportAsynchronously(completionHandler: {
                switch export!.status{
                case  AVAssetExportSessionStatus.failed:
                    print("failed \(export!.error)")
                    print(export?.outputURL)
                case AVAssetExportSessionStatus.cancelled:
                    print("cancelled \(export!.error)")
                default:
                    DispatchQueue.main.async() {
                        print("Movie complete")
                        print(export?.outputURL)
                        let videoURL = export?.outputURL
                        
                        DataService.instance.saveChallengeVideo(file: videoURL!, name: self.newChallengeName!)
                        
                        self.tabBarController?.tabBar.isHidden = false
                    }
                }
            })
            
        }
        catch {
            
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newChallengeView = self.imagePicker?.cameraOverlayView as? NewChallengeView
        newChallengeView?.titleTextfield?.resignFirstResponder()
    }
    
    // image picker cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

