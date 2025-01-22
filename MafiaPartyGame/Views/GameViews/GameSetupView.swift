//
//  PlayView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct GameSetupView: View {
    @Environment(GameState.self) private var gameState
    @State private var isDialogPresented = false
    @State private var playerName = ""
    @State private var selectedCharacter: Character? = nil
    @State private var availableCharacters: [Character] = Characters.all
    
    var body: some View {
            VStack {
                Text("Mafia Party Game")
                    .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
                    .bold()
                
                Button(action: {
                    print("Adding player")
                    isDialogPresented = true
                }) {
                    Image(systemName: "plus").foregroundColor(.red).padding(.leading)
                    Text("Add Player")
                    Spacer()
                }
                .accessibilityIdentifier("Add player")
                .buttonStyle(PlainButtonStyle())
                
                List(gameState.playerList) { player in
                    ZStack(alignment: .leading) {
                        Image(player.character.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 70)
                            .overlay(Color.black.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(player.character.fraction.color, lineWidth: 2))
                            .accessibilityIdentifier(player.name)
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
                
                NavigationLink(destination: MafiaTurnView()) {
                    Text("Start the Game")
                        .font(.custom("AbhayaLibre-Bold", size: 20, relativeTo: .title))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            .sheet(isPresented: $isDialogPresented) {
                PlayerInputDialog(playerName: $playerName, selectedCharacter: $selectedCharacter, availableCharacters: availableCharacters) { name, character in
                    if let character = character {
                        gameState.addPlayer(name: name, character: character)
                    }
                    isDialogPresented = false
                }
            }
    }
}
struct PlayerInputDialog: View {
    @Binding var playerName: String
    @Binding var selectedCharacter: Character?
    let availableCharacters: [Character]
    let onAddPlayer: (String, Character?) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Player Details")) {
                    TextField("Player Name", text: $playerName)
                    Picker("Character", selection: $selectedCharacter) {
                        ForEach(availableCharacters, id: \.id) { character in
                            Text(character.name).tag(character as Character?)
                        }
                    }
                }
            }
            .navigationTitle("Add Player")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        onAddPlayer(playerName, selectedCharacter)
                    }
                    .disabled(playerName.isEmpty || selectedCharacter == nil)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onAddPlayer("", nil)
                    }
                }
            }
        }
    }
    
}

#Preview {
    GameSetupView().environment(GameState())
}
