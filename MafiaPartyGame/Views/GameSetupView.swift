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
        Text("Mafia Party Game")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        Button("Add Player") {
            print("Adding player")
            let loremIpsumCharacter = Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss")
            print("loremIpsumCharacter: \(loremIpsumCharacter)")
            gameState.addPlayer(player: Player(id: "1", character: loremIpsumCharacter))
            
        }
        List(gameState.playerList) { player in
            Text(player.character.name)
        }
        Button("Play") {
            
        }
            
        Text(defaults.string(forKey: "mySetting") ?? "no value")
    }
}

#Preview {
    PlayView().environment(GameState())
}
