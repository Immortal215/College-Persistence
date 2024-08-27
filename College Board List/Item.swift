//
//  Item.swift
//  College Board List
//
//  Created by Sharul M. Shah on 8/27/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
