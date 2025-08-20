//
//  OracleApp.swift
//  Oracle
//
//  Created by Kareem Yacoub on 6/15/25.
//

import SwiftUI
import SwiftData

@main
struct OracleApp: App {
    
    // runs on app launch
    init () {
        FileStorageUtils.createPlaceholderFile()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
