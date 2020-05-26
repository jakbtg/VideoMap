//
//  AnnotationTests.swift
//  VideoMapTests
//
//  Copyright © 2020 Jak. All rights reserved.
//

import XCTest
@testable import VideoMap

class AnnotationTests: XCTestCase {

    var sutAnnotationsList: [Annotation]!
    let videos = Video.createVideos()
    
    override func setUp() {
        super.setUp()
        sutAnnotationsList = Annotation.createAnnotations(videos)
    }
    
    override func tearDown() {
        sutAnnotationsList = nil
        super.tearDown()
    }
    
    func testCreateAnnotations() {
        XCTAssertEqual(sutAnnotationsList.count, videos.count)
    }
    
    func testCreateAnnotationsSettingTitles() {
        var index = 0
        for _ in sutAnnotationsList {
            XCTAssertEqual(sutAnnotationsList[index].title, videos[index].title)
            index = index + 1
        }
    }
    
    func testCreateAnnotationsSettingDates() {
        var index = 0
        for _ in sutAnnotationsList {
            XCTAssertEqual(sutAnnotationsList[index].subtitle, String(videos[index].date))
            index = index + 1
        }
    }
    
    func testCreateAnnotationsSettingLocations() {
        var index = 0
        for _ in sutAnnotationsList {
            XCTAssertEqual(sutAnnotationsList[index].coordinate.latitude, videos[index].coordinate.latitude)
            XCTAssertEqual(sutAnnotationsList[index].coordinate.longitude, videos[index].coordinate.longitude)
            index = index + 1
        }
    }

}
