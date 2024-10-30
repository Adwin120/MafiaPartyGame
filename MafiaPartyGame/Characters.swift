//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by stud on 30/10/2024.
//

import SwiftUI

struct Characters: View {
    
    @State var characters: [Character] = [
        Character(name: "Mafia Boss", descriptionText: "lorem ipsum", image: "", fraction: .Mafia)
    ]
    
    var body: some View {
        List(characters) {character in
            Text(character.name).background(character.fraction.color)
        }
    }
}

#Preview {
    Characters()
}
