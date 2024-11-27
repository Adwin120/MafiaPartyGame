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
            VStack(alignment: .leading, spacing: 20) {
                MenuCardView(
                    title: "Play",
                    subtitle: "Mafia",
                    imageName: "pudzian",
                    fraction: .Mafia)
                { path.append(ViewEnum.Play) }
                MenuCardView(
                    title: "Characters",
                    subtitle: "Compedium",
                    imageName: "pudzian",
                    fraction: .Mafia)
                { path.append(ViewEnum.Characters) }
                MenuCardView(
                    title: "Fractions",
                    subtitle: "Compedium",
                    imageName: "pudzian",
                    fraction: .Mafia)
                { path.append(ViewEnum.Fraction) }
                
                HStack(alignment: .center, spacing: 20) {
                    MenuCardView(
                        title: "User",
                        subtitle: "Settings",
                        imageName: "pudzian",
                        fraction: .Mafia)
                    { path.append(ViewEnum.User) }
                    MenuCardView(
                        title: "App Info",
                        subtitle: "Settings",
                        imageName: "pudzian",
                        fraction: .Mafia)
                    { path.append(ViewEnum.AppInfo) }
                }
            }
            .navigationTitle("Mafia - Party Game")
            .padding()
            .navigationDestination(for: ViewEnum.self) { view in
                    switch view {
                    case .Play: PlayView()
                    case .Characters: CharactersView()
                    case .Fraction: FractionsView()
                    case .User: UserView()
                    case .AppInfo: AppInfoView()
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
