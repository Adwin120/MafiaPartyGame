//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct PlayView: View {
    @Environment(GameState.self) private var gameState
    // for testing purposes changes of game state are in app info :)
    var defaults = UserDefaults.standard
    var body: some View {
        Text("Play")
        Text(gameState.winner?.displayName ?? "in progress")
        List(gameState.players) { player in
            Text(player.character.name)
        }
        Text(defaults.string(forKey: "mySetting") ?? "no value")
    }
}

#Preview {
    PlayView().environment(GameState())
    
}
