//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by stud on 30/10/2024.
//

import SwiftUI

struct CharactersView: View {
    
    @State var characters: [Character] = [
        Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "pudzian"),
        Character(id: 2, name: "Detective", descriptionText: "Mariusz Pudzianowski", fraction: .Town, image: "pudzian")
    ]
    
    var body: some View {
        NavigationSplitView {
            List(characters) {character in
                NavigationLink(character.name, value: character).background(character.fraction.color)
            }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character)
            }
        } detail: {
//            I have no idea what this whole detail thing is
            Text("pudzian")
        }
    }
}

#Preview {
    CharactersView()
}
