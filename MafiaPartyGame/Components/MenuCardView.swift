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
    let onTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame( height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 2))
                .shadow(radius: 10)
            Text(title)
                .font(.custom("AbhayaLibre-Bold", size: 34, relativeTo: .title))
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 10)
            Text(subtitle)
                .font(.custom("AbhayaLibre-Regular", size: 16, relativeTo: .subheadline))
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 48)
                    
        }
        .padding()
        .onTapGesture {
            onTap()
        }
    }
        
}

#Preview {
    MenuCardView(title: "Pudzian", subtitle: "The Strongman", imageName: "pudzian") { print("Tapped") }
}
