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
    
    @Environment(GameState.self) private var gameState
    @State var navigateToMafiaWin = true
    
    @StateObject var navigationManager = NavigationManager()

    
    

    var body: some View {
        
//                if gameState.winner == .Mafia {
//                    path.append(ViewEnum.MafiaWin)
//                } else if gameState.winner == .Town {
//        path.append(ViewEnum.TownWin)
//    }
        NavigationStack(path: $navigationManager.navigationPath) {
                VStack(alignment: .leading, spacing: 10) {
                    MenuCardView(
                        title: "Play",
                        subtitle: "Mafia",
                        imageName: "hunter",
                        fraction: .Mafia)
                    { navigationManager.navigationPath.append(ViewEnum.Play) }
                    MenuCardView(
                        title: "Characters",
                        subtitle: "Compedium",
                        imageName: "cattani",
                        fraction: .Mafia)
                    { navigationManager.navigationPath.append(ViewEnum.Characters) }
                    MenuCardView(
                        title: "Fractions",
                        subtitle: "Compedium",
                        imageName: "mafiaBoss",
                        fraction: .Mafia)
                    { navigationManager.navigationPath.append(ViewEnum.Fraction) }
                    
                    HStack(alignment: .center, spacing: 10) {
                        MenuCardView(
                            title: "User",
                            subtitle: "Settings",
                            imageName: "doctor",
                            fraction: .Mafia)
                        { navigationManager.navigationPath.append(ViewEnum.User) }
                        MenuCardView(
                            title: "App Info",
                            subtitle: "Settings",
                            imageName: "judge",
                            fraction: .Mafia)
                        { navigationManager.navigationPath.append(ViewEnum.AppInfo) }
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
                    case .Play: GameSetupView()
                    case .Characters: CharactersView()
                    case .Fraction: FractionsView()
                    case .User: UserView()
                    case .AppInfo: AppInfoView()
                    case .MafiaWin: MafiaWinView()
                    case .TownWin: TownWinView()
                    }
                }
            NavigationLink(destination: MafiaWinView(), isActive: $navigateToMafiaWin) {
                                EmptyView()
                            }
            
        }
        .environmentObject(navigationManager)
        .preferredColorScheme(.dark)
    }
}

class NavigationManager: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func resetToRoot() {
        navigationPath = NavigationPath() // Clear all paths to go back to the root
    }
}

#Preview {
    MainMenuView().environment(GameState())
}
