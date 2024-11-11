//
//  MainMenuView.swift
//  MafiaPartyGame
//
//  Created by stud on 06/11/2024.
//

import Foundation
import SwiftUICore
import SwiftUI

struct MainMenuView: View {
    
    @State var path: NavigationPath = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                Text("Play")
                NavigationLink {CharactersView()} label: {Text("Characters")}
                Text("Fraction")
                Text("User")
                Text("App Info")
            }
            .navigationTitle("Mafia - Party Game")
        }
        .navigationDestination(for: Character.self) { character in
            CharacterDetailView(character: character)
        }
    }
}

#Preview {
    MainMenuView()
}
