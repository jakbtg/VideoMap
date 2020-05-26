//
//  AppUtility.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This struct provides utility functions for my app.
//

import Foundation
import UIKit

struct AppUtility {
    
    // This function locks the interface orientation as specified in the input.
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
        delegate.orientationLock = orientation
        }
    }
    
}

