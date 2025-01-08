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
        VStack(alignment: .leading) {
            Image(character.image)
                .resizable()
                .scaledToFit()
            Rectangle()
                .fill(character.fraction.color) // Set the line color
                            .frame(width: UIScreen.main.bounds.width * 3 / 4, height: 3) // Set width to 2/3 and height to 2
                        
            Text(character.name)
                .font(.custom("AbhayaLibre-Bold", size: 45, relativeTo: .title))
                .bold()
                .padding()
            Text(character.descriptionText)
                .font(.custom("AbhayaLibre-Regular", size: 20, relativeTo: .title))
                .padding() // Add some padding inside the text
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(character.fraction.color, lineWidth: 2) // Red border with rounded corners
                                )
        }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .ignoresSafeArea()
    }
        
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Mafia Boss", descriptionText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", fraction: .Mafia, image: "mafiaBoss"))
}
