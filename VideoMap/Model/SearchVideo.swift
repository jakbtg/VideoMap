//
//  SearchVideo.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class provides the algorithms for the research of the videos.
//

import Foundation

class SearchVideo {
    
    func searchVideo(_ text: String, _ videos: [Video]) throws -> String {
        var searchedVideo = ""
        if text == "" {
            throw SearchingError.noText
        }
        var countList = [(Int, String)]()
        for video in videos {
            countList.append((compareString(video.title, text), video.title))
        }
        searchedVideo = getMax(countList)
        if searchedVideo == "no match found" {
            throw SearchingError.noMatchFound
        }
        return searchedVideo
    }
    
    // Compare two strings and returns the number of common characters.
    func compareString(_ title: String, _ text: String) -> Int {
        var count = 0
        let iter = compareLength(title, text)
        let actualTitle = title.lowercased()
        let actualText = text.lowercased()
        var i = 0
        while i < iter {
            let index = actualTitle.index(actualTitle.startIndex, offsetBy: i)
            if actualTitle[index] == actualText[index] {
                count = count + 1
            }
            i = i + 1
        }
        return count
    }
    
    // Compare two strings' length and returns the shortest one.
    func compareLength(_ title: String, _ text: String) -> Int {
        var count: Int
        if title.count > text.count {
            count = text.count
        } else {
            count = title.count
        }
        return count
    }
    
    // Get the title of the string with the higher number of common characters.
    // If there are more than 1, returns the shortest title.
    func getMax(_ list: [(Int, String)]) -> String {
        var title = ""
        var max = -1
        for item in list {
            if item.0 > max {
                max = item.0
                title = item.1
            } else if item.0 == max {
                if item.1.count < title.count {
                    title = item.1
                }
            }
        }
        if max == 0 {
            title = "no match found"
        }
        return title
    }
    
}

