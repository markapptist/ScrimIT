//
//  ImagePicker.swift
//  ScrimIT
//
//  Created by Anthony Ma on 11/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import CoreMedia

class ImagePicker: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController?
    var takenVideoURL: URL?

    var videoBtn: UIButton!
    var uploadBtn: UIButton!
    
//    var currentDevice = UIDevice.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = false
        
        self.removeImage(itemName: "Test", fileExtension: "mov")
        
        videoBtn = UIButton(type: .system)
        videoBtn.frame = CGRect(x: view.center.x - 25, y: view.center.y - 25, width: 50, height: 50)
        videoBtn.setTitle("Take Video", for: .normal)
        videoBtn.setTitleColor(UIColor.white, for: .normal)
        videoBtn.addTarget(self, action: #selector(self.takeVideo), for: .touchUpInside)
        
        view.addSubview(videoBtn)
        
        uploadBtn = UIButton(type: .system)
        uploadBtn.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
        uploadBtn.setTitle("Video", for: .normal)
        uploadBtn.setTitleColor(UIColor.white, for: .normal)
        uploadBtn.addTarget(self, action: #selector(self.uploadVideo), for: .touchUpInside)
        
//        view.addSubview(uploadBtn)
    }
    
    func uploadVideo() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker = UIImagePickerController(rootViewController: self)
            
            imagePicker?.delegate = self
            imagePicker?.sourceType = .savedPhotosAlbum
            imagePicker?.mediaTypes = [kUTTypeMovie as String]
            imagePicker?.allowsEditing = true
            self.present(imagePicker!, animated: true, completion: nil)
        }
        else {
            
        }
    }
    
    func takeVideo() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = .camera
            imagePicker?.cameraDevice = .rear
            imagePicker?.mediaTypes = [kUTTypeMovie as String]
            imagePicker?.allowsEditing = true
            imagePicker?.videoQuality = .type640x480
            
            print(imagePicker?.videoQuality)
            
            var t = CGAffineTransform.identity
//            t = t.translatedBy(x: 0, y: 50)
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
        
        videoTransform.a = 0.0
        videoTransform.b = 1.0
        videoTransform.c = -1.0
        videoTransform.d = 0
        
//        let translate = CGAffineTransform(translationX: 100, y: 100)
        
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
            
            let finalURL: URL = documentDirectory.appendingPathComponent("Test")
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
                        
                        print()
                        
                        DataService.instance.saveChallengeVideo(file: videoURL!, name: "Test", videoName: "TestVid")
                        
                        self.tabBarController?.tabBar.isHidden = false
                    }
                }
            })
            
        }
        catch {
            
        }
        
    }
    
    // cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
//    ImagePicker saveVideo
    /*
    func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        var title = "Success"
        var message = "Video was saved"
        if let _ = error {
            title = "Error"
            message = "Video failed to save"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    */
    
}

