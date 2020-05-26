//
//  BlurTableViewExtension.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This extension adds to the TableViewController class two method to handle the blur.
//

import Foundation
import UIKit

extension TableViewController {
    
    func addBlur() {
        let blur = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurView)
    }
    
    func removeBlur() {
        for view in self.view.subviews {
            if let view = view as? UIVisualEffectView {
                view.removeFromSuperview()
            }
        }
    }
}
