//
//  UploadProgress.swift
//  ScrimIT
//
//  Created by Anthony Ma on 14/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

protocol UploadProgressDelegate {
    func showActivityView()
    func removeActivityView()
    func errorUploading(error: Error)
}

extension CameraVC: UploadProgressDelegate {
    
    func showActivityView() {
        self.activityView = UIActivityIndicatorView()
        self.activityView?.frame = self.view.frame
        self.activityView?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        self.view.addSubview(self.activityView!)
        self.activityView?.startAnimating()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func removeActivityView() {
        self.activityView?.stopAnimating()
        self.activityView?.removeFromSuperview()
        self.navigationController?.navigationBar.isHidden = false
        self.displayPosted()
    }
    
    func errorUploading(error: Error) {
        self.errorUploading(error: error)
    }
    
}
