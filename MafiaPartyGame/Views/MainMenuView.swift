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
                VStack(alignment: .leading, spacing: 10) {
                    MenuCardView(
                        title: "Play",
                        subtitle: "Mafia",
                        imageName: "hunter",
                        fraction: .Mafia)
                    { path.append(ViewEnum.Play) }
                    MenuCardView(
                        title: "Characters",
                        subtitle: "Compedium",
                        imageName: "cattani",
                        fraction: .Mafia)
                    { path.append(ViewEnum.Characters) }
                    MenuCardView(
                        title: "Fractions",
                        subtitle: "Compedium",
                        imageName: "mafiaBoss",
                        fraction: .Mafia)
                    { path.append(ViewEnum.Fraction) }
                    
                    HStack(alignment: .center, spacing: 10) {
                        MenuCardView(
                            title: "User",
                            subtitle: "Settings",
                            imageName: "doctor",
                            fraction: .Mafia)
                        { path.append(ViewEnum.User) }
                        MenuCardView(
                            title: "App Info",
                            subtitle: "Settings",
                            imageName: "judge",
                            fraction: .Mafia)
                        { path.append(ViewEnum.AppInfo) }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Mafia Party Game")
                            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
                            .bold()
                    }
                }
                
                //this can be used to make custom title
                
                //            .navigationBarTitleDisplayMode(.inline)
                //            .toolbar {
                //                ToolbarItem(placement: .principal) {
                //                    Text("title").font(.headline)
                //                }
                //            }
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
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainMenuView().environment(GameState())
}
