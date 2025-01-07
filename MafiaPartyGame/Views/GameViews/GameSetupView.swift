//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct GameSetupView: View {
    @Environment(GameState.self) private var gameState
    // for testing purposes changes of game state are in app info :)
    var defaults = UserDefaults.standard
    var body: some View {
        Text("Mafia Party Game")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        Button(action: {
            print("Adding player")
            var loremIpsumCharacter = Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss")
            print("loremIpsumCharacter: \(loremIpsumCharacter)")
            gameState.addPlayer(player: Player(id: "1", name: "Karol", character: loremIpsumCharacter))
            
            loremIpsumCharacter = Character(id: 2, name: "Cattani", descriptionText: "lorem ipsum", fraction: .Town, image: "cattani")
            print("loremIpsumCharacter: \(loremIpsumCharacter)")
            gameState.addPlayer(player: Player(id: "2", name: "Agnieszka", character: loremIpsumCharacter))
            
        }) {
            Image(systemName: "plus").foregroundColor(.red).padding(.leading)
            Text("Add Player")
            Spacer()
            
        }.buttonStyle(PlainButtonStyle())
        List(gameState.playerList) { player in
            ZStack(alignment: .leading) {
                Image(player.character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 70)
                    .overlay(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(player.character.fraction.color, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.custom("AbhayaLibre-Bold", size: 20, relativeTo: .title))
                        .bold()
                        .foregroundColor(.white)
                    Text(player.character.name)
                        .font(.custom("AbhayaLibre-Regular", size: 15, relativeTo: .title))
                        .bold()
                        .foregroundColor(Color(UIColor.systemGray4))
                }.padding()
            }
            .listRowInsets(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
        }
        .listStyle(.inset)
        
        Button(action: {
                    print("Play")
                }) {
                    Text("Start the Game") // Text
                        .font(.custom("AbhayaLibre-Bold", size: 20, relativeTo: .title)) // Font size
                        .foregroundColor(.white) // Text color
                        .padding() // Padding inside the button
                        .frame(maxWidth: .infinity) // Optional: Make it fill the width
                        .background(Color.red) // Background color
                        .cornerRadius(10) // Rounded corners
                }
                .padding()

    }
}

#Preview {
    GameSetupView().environment(GameState())
}
