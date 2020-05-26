//
//  VideoTests.swift
//  VideoMapTests
//
//  Copyright © 2020 Jak. All rights reserved.
//

import XCTest
@testable import VideoMap
import MapKit

class VideoTests: XCTestCase {

    var sutLock: Bool!
    var sutLocation: CLLocationCoordinate2D!
    var sutList: [Video]!
    
    override func setUp() {
        super.setUp()
        sutList = Video.createVideos()
        sutLock = Bool()
        sutLocation = CLLocationCoordinate2D()
    }

    override func tearDown()  {
        sutList = nil
        sutLock = nil
        sutLocation = nil
        super.tearDown()
    }

    func testCreateVideos() {
        XCTAssertEqual(sutList.count, 24) // I know there are 24 videos.
    }
    
    func testGetVideoLockTrue() {
        sutLock = Video.getVideoLock("Venezia", sutList)
        XCTAssertEqual(sutLock, true) // I know "Venezia" is locked.
    }
    
    func testGetVideoLockFalse() {
        sutLock = Video.getVideoLock("Abetone", sutList)
        XCTAssertEqual(sutLock, false) // I know "Abetone" is not locked.
    }
    
    func testGetVideoLocation() {
        sutLocation = Video.getVideoLocation("Livigno", sutList)
        XCTAssertEqual(sutLocation.latitude, 46.530789)
        XCTAssertEqual(sutLocation.longitude, 10.109383)
        // I know "Livigno" has these coordinates.
    }

}
