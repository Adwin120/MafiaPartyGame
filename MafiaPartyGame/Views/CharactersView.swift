//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by stud on 30/10/2024.
//

import SwiftUI

struct CharactersView: View {
    
    @State var characters: [Character] = [
        Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss"),
        Character(id: 2, name: "Detective", descriptionText: "Mariusz Pudzianowski", fraction: .Town, image: "cattani")
    ]
    
    var body: some View {
        List(characters) {character in
            ZStack(alignment: .leading) {
                Image(character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 70)
                    .overlay(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(character.fraction.color, lineWidth: 2))
                
                NavigationLink(value: character) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.custom("AbhayaLibre-Bold", size: 20, relativeTo: .title))
                            .bold()
                            .foregroundColor(.white)
                        Text(character.fraction.displayName)
                            .font(.custom("AbhayaLibre-Regular", size: 15, relativeTo: .title))
                            .bold()
                            .foregroundColor(Color(UIColor.systemGray4))
                    }
                }.padding()
            }
            .listRowInsets(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
        }
        
        .listStyle(.inset)
        .navigationDestination(for: Character.self) { character in
            CharacterDetailView(character: character)
        }
        .navigationTitle("Characters")
    }
}

#Preview {
    NavigationStack {
        CharactersView()
    }
}
