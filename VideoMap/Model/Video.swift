//
//  Video.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This struct represents my Videos.
//

import Foundation
import MapKit

struct Video {
    
    let title: String
    let date: Int
    let image: String
    let lock: Bool
    let coordinate: CLLocationCoordinate2D
    
    // Creates all my videos.
    static func createVideos() -> [Video] {
        var list = [Video]()
        let v1 = Video(title: "Abetone", date: 2015, image: "Abetone", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        let v2 = Video(title: "Croazia", date: 2017, image: "Croazia", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.128929, longitude: 16.316227))
        let v3 = Video(title: "Dreaming in London", date: 2016, image: "Dreaming in London", lock: false, coordinate: CLLocationCoordinate2D(latitude: 51.507854, longitude: -0.127825))
        let v4 = Video(title: "Fixed in Florence", date: 2015, image: "Fixed in Florence", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.769759, longitude: 11.255486))
        let v5 = Video(title: "Giro dell'Elba in canoa", date: 2019, image: "Giro dell'Elba in canoa", lock: false, coordinate: CLLocationCoordinate2D(latitude: 42.779615, longitude: 10.277087))
        let v6 = Video(title: "Ios", date: 2016, image: "Ios", lock: false, coordinate: CLLocationCoordinate2D(latitude: 36.722067, longitude: 25.330115))
        let v7 = Video(title: "Kos", date: 2015, image: "Kos", lock: false, coordinate: CLLocationCoordinate2D(latitude: 36.826699, longitude: 27.139103))
        let v8 = Video(title: "La Thuile", date: 2015, image: "La Thuile", lock: false, coordinate: CLLocationCoordinate2D(latitude: 45.693548, longitude: 6.926055))
        let v9 = Video(title: "Le Hammelle", date: 2019, image: "Le Hammelle", lock: false, coordinate: CLLocationCoordinate2D(latitude: 31.709182, longitude: -6.406208))
        let v10 = Video(title: "Livigno", date: 2018, image: "Livigno", lock: false, coordinate: CLLocationCoordinate2D(latitude: 46.530789, longitude: 10.109383))
        let v11 = Video(title: "Longboard", date: 2016, image: "Longboard", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.737450, longitude: 11.571516))
        let v12 = Video(title: "Portugal", date: 2017, image: "Portugal", lock: true, coordinate: CLLocationCoordinate2D(latitude: 38.780383, longitude: -9.498904))
        let v13 = Video(title: "PowDay", date: 2017, image: "PowDay", lock: false, coordinate: CLLocationCoordinate2D(latitude: 46.488712, longitude: 12.067007))
        let v14 = Video(title: "Prematuri", date: 2016, image: "Prematuri", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.934610, longitude: 11.299550))
        let v15 = Video(title: "Rainbow Mountains", date: 2017, image: "Rainbow Mountains", lock: false, coordinate: CLLocationCoordinate2D(latitude: -13.873386, longitude: -71.301039))
        let v16 = Video(title: "San Martino", date: 2019, image: "San Martino", lock: false, coordinate: CLLocationCoordinate2D(latitude: 46.258629, longitude: 11.776005))
        let v17 = Video(title: "Sestriere", date: 2020, image: "Sestriere", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.958110, longitude: 6.894258))
        let v18 = Video(title: "Sorshossegor", date: 2019, image: "Sorshossegor", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.662651, longitude: -1.441937))
        let v19 = Video(title: "Stubai", date: 2015, image: "Stubai", lock: false, coordinate: CLLocationCoordinate2D(latitude: 46.984078, longitude: 11.108382))
        let v20 = Video(title: "Tenerife", date: 2018, image: "Tenerife", lock: false, coordinate: CLLocationCoordinate2D(latitude: 28.232246, longitude: -16.641307))
        let v21 = Video(title: "TOURscany", date: 2019, image: "TOURscany", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.312314, longitude: 10.519120))
        let v22 = Video(title: "Venezia", date: 2017, image: "Venezia", lock: true, coordinate: CLLocationCoordinate2D(latitude: 45.429947, longitude: 12.343055))
        let v23 = Video(title: "Water Flow", date: 2016, image: "Water Flow", lock: false, coordinate: CLLocationCoordinate2D(latitude: 43.404755, longitude: 11.136203))
        let v24 = Video(title: "Palm Beach", date: 2020, image: "Palm Beach", lock: false, coordinate: CLLocationCoordinate2D(latitude: -33.583162, longitude: 151.327117))
        
        list.append(v1)
        list.append(v2)
        list.append(v3)
        list.append(v4)
        list.append(v5)
        list.append(v6)
        list.append(v7)
        list.append(v8)
        list.append(v9)
        list.append(v10)
        list.append(v11)
        list.append(v12)
        list.append(v13)
        list.append(v14)
        list.append(v15)
        list.append(v16)
        list.append(v17)
        list.append(v18)
        list.append(v19)
        list.append(v20)
        list.append(v21)
        list.append(v22)
        list.append(v23)
        list.append(v24)
        
        return list
    }
    
    // Returns the given video lock field.
    static func getVideoLock(_ title: String, _ videos: [Video]) -> Bool {
        var lock = false
        for video in videos {
            if video.title == title {
                lock = video.lock
            }
        }
        return lock
    }
    
    // Returns the given video location.
    static func getVideoLocation(_ title: String, _ videos: [Video]) -> CLLocationCoordinate2D {
        var location = CLLocationCoordinate2D()
        for video in videos {
            if video.title == title {
                location = video.coordinate
            }
        }
        return location
    }
    
}
