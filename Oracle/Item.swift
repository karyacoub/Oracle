//
//  Item.swift
//  Oracle
//
//  Created by Kareem Yacoub on 6/15/25.
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
