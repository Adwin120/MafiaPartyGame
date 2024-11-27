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
                NavigationLink("Play", value: ViewEnum.Play)
                NavigationLink("Characters", value: ViewEnum.Characters)
                NavigationLink("Fractions", value: ViewEnum.Fraction)
                NavigationLink("User", value: ViewEnum.User)
                NavigationLink("AppInfo", value: ViewEnum.AppInfo)
                
                MenuCardView(
                    title: "Pudzian",
                    subtitle: "The Strongman",
                    imageName: "pudzian",
                    fraction: Fraction.Mafia)
                { path.append(ViewEnum.Play) }
            }
            .navigationTitle("Mafia - Party Game")
            .navigationDestination(for: ViewEnum.self) { view in
                    switch view {
                    case .Play: PlayView()
                    case .Characters: CharactersView()
                    case .Fraction: FractionsView()
                    case .User: UserView()
                    case .AppInfo: AppInfoView()
                    default: CharactersView()
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
