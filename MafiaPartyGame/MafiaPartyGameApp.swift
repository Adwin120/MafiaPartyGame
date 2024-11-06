//
//  MafiaPartyGameApp.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 23/10/2024.
//

import SwiftUI
import SwiftData

@main
struct MafiaPartyGameApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
    }
}
