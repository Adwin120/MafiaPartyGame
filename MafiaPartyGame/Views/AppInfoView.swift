//
//  AppInfoView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct AppInfoView: View {
    //just for testing
    @Environment(GameState.self) private var gameState
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        // Z stack
        ZStack {
            // background image with height 200 and full width
            
            
            Image("pudzian")
                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .clipped()
            
                Text("App Info")
            .font(.title)
            .bold();
            
        }.onTapGesture { // just for testing
            let loremIpsumCharacter = Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss")
            gameState.winner = .Mafia
            gameState.players["1"] = Player(id: "1", character: loremIpsumCharacter)
            defaults.set("myValue", forKey: "mySetting")
        }
        
    }
}

#Preview {
    AppInfoView().environment(GameState())
}
