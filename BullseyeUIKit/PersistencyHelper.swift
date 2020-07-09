//
//  PersistencyHelper.swift
//  BullseyeUIKit
//
//  Created by Kiryl Beliauski on 7/9/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import Foundation

class PersistencyHelper {
    
    static func saveHighScores(_ items: [HighScoreItem]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("error")
        }
    }
    
    static func loadHighScores() -> [HighScoreItem] {
        var items = [HighScoreItem]()
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([HighScoreItem].self, from: data)
            } catch {
                print("error")
            }
        }
        return items
    }
    
    static func dataFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent("HighScores.plist")
    }
}

