//
//  SwiftUIView.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 20/11/2024.
//

import SwiftUI

struct MenuCardView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let fraction: Fraction
    let onTap: () -> Void
    
    private var borderColor: Color {
            switch fraction {
            case .Town:
                return .yellow
            case .Mafia:
                return .red
            case .Syndicate:
                return .blue
            }
        }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame( minHeight: 10 )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                                    Color.black.opacity(0.6) // This darkens the image
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                )
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(borderColor.opacity(0.7), lineWidth: 2))
                .shadow(radius: 10)
                
            Text(title)
                .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 10)
            Button(action: {
                onTap()
            }) {
                Text("some text")
            }
            .opacity(0)
            .accessibilityIdentifier(title)
            .accessibilityAction(named: "some magic"){
                onTap()
            }
            Text(subtitle)
                .font(.custom("AbhayaLibre-Regular", size: 16, relativeTo: .subheadline))
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 48)
                    
        }
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            onTap()
        }
        
    }
        
}

#Preview {
    Group {
        MenuCardView(title: "Cattani", subtitle: "Miasto", imageName: "cattani", fraction: Fraction.Town) { print("Tapped") }
//        MenuCardView(title: "Szef Mafii", subtitle: "Mafia", imageName: "mafiaBoss", fraction: Fraction.Mafia) { print("Tapped") }
//        MenuCardView(title: "Szef Mafii", subtitle: "Mafia", imageName: "hunter", fraction: Fraction.Syndicate) { print("Tapped") }
    }
    
}
