//
//  ShakeTextFieldExtension.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This extension add to the UITextField class a method called "shake()".
//

import Foundation
import UIKit

extension UITextField {
    
    // Shakes the selected text field.
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 5.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 5.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
