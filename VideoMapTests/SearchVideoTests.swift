//
//  SearchVideoTests.swift
//  VideoMapTests
//
//  Copyright © 2020 Jak. All rights reserved.
//

import XCTest
@testable import VideoMap

class SearchVideoTests: XCTestCase {
    
    var sut: SearchVideo!
    let videos = Video.createVideos()

    override func setUp() {
        super.setUp()
        sut = SearchVideo()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNoText() {
        XCTAssertThrowsError(try sut.searchVideo("", videos), "Should throw error") { error in
            XCTAssertEqual(error as? SearchingError, SearchingError.noText)
        }
    }
    
    func testOneLetter() {
        if let searchedVideoTitle = try? sut.searchVideo("A", videos) {
            XCTAssertEqual(searchedVideoTitle, "Abetone")
        }
    }
    
    func testCorrectSearch() {
        if let searchedVideoTitle = try? sut.searchVideo("Abetone", videos) {
            XCTAssertEqual(searchedVideoTitle, "Abetone")
        }
    }
    
    func testSimilarSearch() {
        if let searchedVideoTitle = try? sut.searchVideo("Anetine", videos) {
            XCTAssertEqual(searchedVideoTitle, "Abetone")
        }
    }
    
    func testLowerCase() {
        if let searchedVideoTitle = try? sut.searchVideo("abetone", videos) {
            XCTAssertEqual(searchedVideoTitle, "Abetone")
        }
    }
    
    func testAllUpperCase() {
        if let searchedVideoTitle = try? sut.searchVideo("ABETONE", videos) {
            XCTAssertEqual(searchedVideoTitle, "Abetone")
        }
    }
    
    func testNoMatchFound() {
        XCTAssertThrowsError(try sut.searchVideo("xyk", videos), "Should throw error") { error in
            XCTAssertEqual(error as? SearchingError, SearchingError.noMatchFound)
        }
    }
    
    func testCompareStringZero() {
        let title = "abc"
        let text = "xyz"
        let count = sut.compareString(title, text)
        XCTAssertEqual(count, 0)
    }
    
    func testCompareStringSome() {
        let title = "abcd"
        let text = "axyd"
        let count = sut.compareString(title, text)
        XCTAssertEqual(count, 2)
    }
    
    func testCompareStringAll() {
        let title = "abcd"
        let text = "abcd"
        let count = sut.compareString(title, text)
        XCTAssertEqual(count, 4)
    }
    
    func testCompareStringUpLowCase() {
        let title = "aBcD"
        let text = "AbCd"
        let count = sut.compareString(title, text)
        XCTAssertEqual(count, 4)
    }
    
    func testCompareLengthSame() {
        let title = "abcd"
        let text = "abcd"
        let count = sut.compareLength(title, text)
        XCTAssertEqual(count, 4)
    }
    
    func testCompareLengthLongerText() {
        let title = "abcd"
        let text = "abcdefgh"
        let count = sut.compareLength(title, text)
        XCTAssertEqual(count, 4)
    }
    
    func testCompareLengthLongerTitle() {
        let title = "abcdefgh"
        let text = "abc"
        let count = sut.compareLength(title, text)
        XCTAssertEqual(count, 3)
    }
    
    func testGetMaxOne() {
        let list = [(2, "A"), (1, "B")]
        let searchedTitle = sut.getMax(list)
        XCTAssertEqual(searchedTitle, "A")
    }
    
    func testGetMaxTwo() {
        let list = [(2, "Ab"), (2, "B")]
        let searchedTitle = sut.getMax(list)
        XCTAssertEqual(searchedTitle, "B")
    }

}
