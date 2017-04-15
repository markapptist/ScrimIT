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


