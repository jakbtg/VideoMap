//
//  SortVideosTests.swift
//  VideoMapTests
//
//  Copyright © 2020 Jak. All rights reserved.
//

import XCTest
@testable import VideoMap
import MapKit

class SortVideosTests: XCTestCase {
    
    var sut: SortVideos!
    var sutList: [Video]!
    var expectedList: [String]!

    override func setUp() {
        super.setUp()
        
        sut = SortVideos()
        sutList = [Video]()
        expectedList = [String]()
        
        let v1 = Video(title: "D", date: 2015, image: "D", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        let v2 = Video(title: "B", date: 2018, image: "B", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        let v3 = Video(title: "A", date: 2019, image: "A", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        let v4 = Video(title: "E", date: 2017, image: "E", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        let v5 = Video(title: "C", date: 2020, image: "C", lock: false, coordinate: CLLocationCoordinate2D(latitude: 44.134377, longitude: 10.645460))
        sutList.append(v1)
        sutList.append(v2)
        sutList.append(v3)
        sutList.append(v4)
        sutList.append(v5)
    }

    override func tearDown() {
        sut = nil
        sutList = nil
        expectedList = nil
        super.tearDown()
    }

    func testSortAZ() {
        makeAZexpectedList()
        sutList = sut.sortAZ(sutList)
        assertListOrderByTitle(sutList, expectedList)
    }
    
    func makeAZexpectedList() {
        expectedList = ["A", "B", "C", "D", "E"]
    }
    
    func testSortZA() {
        makeZAexpectedList()
        sutList = sut.sortZA(sutList)
        assertListOrderByTitle(sutList, expectedList)
    }
    
    func makeZAexpectedList() {
        expectedList = ["E", "D", "C", "B", "A"]
    }
    
    func assertListOrderByTitle(_ sutList: [Video], _ expectedList: [String]) {
        var index = 0
        for _ in expectedList {
            XCTAssertEqual(sutList[index].title, expectedList[index])
            index += 1
        }
    }
    
    func testSortRecent() {
        makeRecentExpectedList()
        sutList = sut.sortRecent(sutList)
        assertListOrderByDate(sutList, expectedList)
    }
    
    func makeRecentExpectedList() {
        expectedList = ["2020", "2019", "2018", "2017", "2015"]
    }
    
    func testSortOlder() {
        makeOlderExpectedList()
        sutList = sut.sortOlder(sutList)
        assertListOrderByDate(sutList, expectedList)
    }
    
    func makeOlderExpectedList() {
        expectedList = ["2015", "2017", "2018", "2019", "2020"]
    }
    
    func assertListOrderByDate(_ sutList: [Video], _ expectedList: [String]) {
        var index = 0
        for _ in expectedList {
            XCTAssertEqual(String(sutList[index].date), expectedList[index])
            index += 1
        }
    }
    
    

}
