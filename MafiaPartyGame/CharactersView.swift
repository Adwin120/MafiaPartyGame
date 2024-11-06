//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by stud on 30/10/2024.
//

import SwiftUI

struct CharactersView: View {
    
    @State var characters: [Character] = [
        Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: ""),
        Character(id: 2, name: "Detective", descriptionText: "", fraction: .Town, image: "")
    ]
    
    var body: some View {
        NavigationStack {
            List(characters) {character in
                NavigationLink(character.name, value: character).background(character.fraction.color)
            }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character)
            }
        }
    }
}

#Preview {
    CharactersView()
}
