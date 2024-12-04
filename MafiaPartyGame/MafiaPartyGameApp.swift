//
//  MafiaPartyGameApp.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 23/10/2024.
//

import SwiftUI
import SwiftData

//extension EnvironmentValues {
//    var gameState: GameState {
//            get { self[GameStateKey.self] }
//            set { self[GameStateKey.self] = newValue }
//        }
//}
//
//private struct GameStateKey: EnvironmentKey {
//    static let defaultValue: GameState = GameState()
//}

@main
struct MafiaPartyGameApp: App {
    @State private var gameState = GameState()

    var body: some Scene {
        WindowGroup {
            MainMenuView().environment(gameState).modelContainer(for: GameConfig.self)
        }
    }
}
