//
//  BookWormApp.swift
//  BookWorm
//
//  Created by APPLE on 18/07/24.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
           ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
