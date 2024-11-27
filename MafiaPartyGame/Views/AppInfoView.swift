//
//  AppInfoView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        // Z stack
        ZStack {
            // background image with height 200 and full width
            
            
            Image("pudzian")
                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .clipped()
            
                Text("App Info")
            .font(.title)
            .bold();
            
        }
        
    }
}

#Preview {
    AppInfoView()
}
