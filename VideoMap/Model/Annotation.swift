//
//  Annotation.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class represents the map annotations.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
    
    // Creates all the annotations.
    static func createAnnotations(_ videos: [Video]) -> [Annotation] {
        var annotationsList = [Annotation]()
        for video in videos {
            annotationsList.append(Annotation.init(title: video.title, subtitle: String(video.date), coordinate: video.coordinate))
        }
        return annotationsList
    }
    
}
