//
//  AppInfoView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct TownWinView: View {
    @Environment(\.presentationMode) var presentationMode // Environment to dismiss or go back

    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Mafia Wins!")
                .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
                .bold()
            Image("cattani")
                .resizable()
                .scaledToFill()
                .frame( width: 400)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    Color.black.opacity(0.6) // This darkens the image
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                )
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.yellow.opacity(0.7), lineWidth: 2))
                .shadow(radius: 10)
                
            Button(action: {
                        print("Go back to Menu")
                presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Go back to Menu") // Text
                            .font(.custom("AbhayaLibre-Bold", size: 20, relativeTo: .title)) // Font size
                            .foregroundColor(.white) // Text color
                            .padding() // Padding inside the button
                            .frame(maxWidth: .infinity) // Optional: Make it fill the width
                            .background(Color.yellow.opacity(0.7)) // Background color
                            .cornerRadius(10) // Rounded corners
                    }
                    .padding()
            
        }
    }
}

#Preview {
    TownWinView().environment(GameState())
}