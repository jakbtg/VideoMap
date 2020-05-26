//
//  SortVideos.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class provides the sorting algorithms.
//

import Foundation

class SortVideos {
    
    // Sort by title, from A to Z.
    func sortAZ(_ list: [Video]) -> [Video] {
        let sortedList = list.sorted(by: {$0.title < $1.title})
        return sortedList
    }
    
    // Sort by title, from Z to A.
    func sortZA(_ list: [Video]) -> [Video] {
        let sortedList = list.sorted(by: {$0.title > $1.title})
        return sortedList
    }
    
    // Sort by date, from recent to older.
    func sortRecent(_ list: [Video]) -> [Video] {
        let sortedList = list.sorted(by: {$0.date > $1.date})
        return sortedList
    }
    
    // Sort by date, from older to recent.
    func sortOlder(_ list: [Video]) -> [Video] {
        let sortedList = list.sorted(by: {$0.date < $1.date})
        return sortedList
    }
    
}
