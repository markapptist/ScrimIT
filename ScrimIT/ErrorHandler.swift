//
//  ErrorHandler.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-27.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit

typealias okResponse = () -> Void

class ErrorHandler: NSObject {
    static let sharedInstance = ErrorHandler()
    let errorMessageView = MessageView()
    
    func show(message: String, container: UIViewController) {
        //Show Message View With Message
        errorMessageView.messageContent.text = message
        errorMessageView.offsetImagePosition()
        container.view.addSubview(errorMessageView)
        
    }
    
    func show(title: String, message: String, buttonText: String, container: UIViewController, onOK:okResponse) {
        //Show Alert View With Alert
    }
    
}

