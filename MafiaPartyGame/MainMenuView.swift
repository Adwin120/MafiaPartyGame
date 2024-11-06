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
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Play")
                NavigationLink {CharactersView()} label: {Text("Characters")}
                Text("Fraction")
                Text("User")
                Text("App Info")
            }
            .navigationTitle("Mafia - Party Game")
        }
    }
}

#Preview {
    MainMenuView()
}
