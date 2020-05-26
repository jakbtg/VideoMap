//
//  AnnotationView.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class lets me customize the appearance of the annotations on the map.
//

import Foundation
import MapKit

class AnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let videoAnnotation = newValue as? Annotation else {
                return
            }
            let videoPinImage = UIImage(systemName: "video.fill")
            glyphImage = videoPinImage
            canShowCallout = true
            leftCalloutAccessoryView = createImageView(videoAnnotation)
            rightCalloutAccessoryView = createPlayButton()
        }
    }
    
    // Link the selected video image to be shown on the annotation callout.
    func createImageView(_ videoAnnotation: Annotation) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 36))
        imageView.image = UIImage(named: videoAnnotation.title!)
        return imageView
    }
    
    // Create the play button to be put on the annotation callout.
    func createPlayButton() -> UIButton {
        let videoButton = UIButton(type: .detailDisclosure)
        let playImage = UIImage(systemName: "play.fill")
        videoButton.setImage(playImage, for: .normal)
        return videoButton
    }
    
}
