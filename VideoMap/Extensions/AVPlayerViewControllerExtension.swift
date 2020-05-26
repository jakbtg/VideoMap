//
//  AVPlayerViewControllerExtension.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  I use this to fix a bug of the AVPlayerViewController.
//

import Foundation
import AVKit
import AVFoundation

extension AVPlayerViewController {
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player?.pause()
    }
}
