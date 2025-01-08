//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct DayView: View {
    @Environment(GameState.self) private var gameState
    // for testing purposes changes of game state are in app info :)
    var defaults = UserDefaults.standard
    @State private var navigateToMafiaTurn = false
    @State private var navigateToMafiaWin = false
    @State private var navigateToTownWin = false
    
    var body: some View {
        Text("Day Phase")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        Text("Select Player to eliminate by town")
            .font(.custom("AbhayaLibre-Regular", size: 20, relativeTo: .title))
        
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
            .onTapGesture {
                // eliminate player
                // go to next turn, mafia turn
                gameState.execute(playerId: player.id)
                
                if gameState.winner == .Mafia {
                    print("Mamy zwyciezce Mafie")
                    self.navigateToMafiaWin = true
                } else if gameState.winner == .Town {
                    print("Mamy zwyciezce Town")
                    self.navigateToTownWin = true
                } else {
                    navigateToMafiaTurn = true
                }
               
            }
            .listRowInsets(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
        }
        .listStyle(.inset)
        NavigationLink(destination: MafiaTurnView(), isActive: $navigateToMafiaTurn) {
                            EmptyView()
                        }
        NavigationLink(destination: MafiaWinView(), isActive:
        $navigateToMafiaWin) {
                            EmptyView()
                        }
        NavigationLink(destination: TownWinView(), isActive:
        $navigateToTownWin) {
                            EmptyView()
                        }
    }
}

#Preview {
    DayView().environment(GameState())
}
