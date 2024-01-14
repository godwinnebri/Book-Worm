//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Godwin IE on 18/12/2023.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}

