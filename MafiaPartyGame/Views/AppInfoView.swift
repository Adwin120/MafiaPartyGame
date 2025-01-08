//
//  AppInfoView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct AppInfoView: View {
    //just for testing
    @Environment(GameState.self) private var gameState
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        Text("App info view")
            .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
            .bold()
        
        
    }
}

#Preview {
    AppInfoView().environment(GameState())
}
