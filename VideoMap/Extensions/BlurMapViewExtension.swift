//
//  BlurMapViewExtension.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This extension adds to the MKMapView class two methods to handle the blur.
//

import Foundation
import UIKit
import MapKit

extension MKMapView {
    
    func addBlur() {
        let blur = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurView)
    }
    
    func removeBlur() {
        for view in self.subviews {
            if let view = view as? UIVisualEffectView {
                view.removeFromSuperview()
            }
        }
    }
}
