//
//  SetVideoDetails.swift
//  ScrimIT
//
//  Created by Anthony Ma on 23/4/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation

protocol SetVideoDetails {
    func didPressWithDetails(name: String)
//    func didPressWithDetails(name: String, duration: Int)
    func noDetails()
    func response(videoID: String)
}
