//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct CattaniTurnView: View {
    @Environment(GameState.self) private var gameState
    @State private var showAlert = false
    @State private var selectedPlayer: Player?
    // for testing purposes changes of game state are in app info :)
    var defaults = UserDefaults.standard
    var body: some View {
        Text("Cattani Turn")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        Text("Select Player to check")
            .font(.custom("AbhayaLibre-Regular", size: 20, relativeTo: .title))
        
        List(gameState.playerList) { player in
            ZStack(alignment: .leading) {
                Image(player.character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 70)
                    .overlay(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.orange, lineWidth: 2))
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
            .onTapGesture {
                print("Player tapped")
                selectedPlayer = player
                showAlert = true
            }
            .listRowInsets(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
        }
        .listStyle(.inset)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Player \(selectedPlayer?.name ?? "Unknown") is from \(selectedPlayer?.character.fraction.displayName ?? "Unknown")"
                            ),
                  dismissButton: .default(Text("OK")) {
                // go to next view
            }
            
            )
        }
}
    
}

#Preview {
    CattaniTurnView().environment(GameState())
}
