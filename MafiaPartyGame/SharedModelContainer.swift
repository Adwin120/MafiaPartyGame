//
//  SharedModelContainer.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 08/01/2025.
//
import SwiftData

class SharedModelContainer {
    static let shared: ModelContainer = {
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
}
