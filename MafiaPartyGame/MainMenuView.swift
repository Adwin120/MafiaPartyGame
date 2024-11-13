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
    
    @State var path: NavigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                Text("Play")
                NavigationLink("Characters", value: ViewEnum.Characters)
                Text("Fraction")
                Text("User")
                Text("App Info")
            }
            .navigationTitle("Mafia - Party Game")
            .navigationDestination(for: ViewEnum.self) {
                view in CharactersView()
            }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character)
            }
        }
    }
}

#Preview {
    MainMenuView()
}
