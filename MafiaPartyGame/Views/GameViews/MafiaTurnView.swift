//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct MafiaTurnView: View {
    @Environment(GameState.self) private var gameState
    // for testing purposes changes of game state are in app info :)
    var defaults = UserDefaults.standard
    @State private var navigateToDoctorTurn = false // State for navigation
    var body: some View {
        Text("Mafia Turn")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        Text("Select Player to eliminate")
            .font(.custom("AbhayaLibre-Regular", size: 20, relativeTo: .title))
        
        List(gameState.playerList.filter {$0.status == .Alive}) { player in
            ZStack(alignment: .leading) {
                Image(player.character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 70)
                    .overlay(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.red, lineWidth: 2))
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
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    gameState.assassinate(playerId: player.id)
                    navigateToDoctorTurn = true
                    
                    // go to next turn
                }
                    
            }
        }
        .listStyle(.inset)
        NavigationLink(destination: DoctorTurnView(), isActive: $navigateToDoctorTurn) {
                            EmptyView()
                        }

    }
}

#Preview {
    MafiaTurnView().environment(GameState())
}
