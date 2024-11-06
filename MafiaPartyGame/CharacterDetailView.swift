//
//  CharacterDetailView.swift
//  MafiaPartyGame
//
//  Created by stud on 06/11/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    var body: some View {
        VStack {
            Text(character.image)
            Text(character.name)
            Text(character.descriptionText)
        }.background(character.fraction.color)
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: ""))
}
