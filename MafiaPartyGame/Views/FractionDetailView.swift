//
//  FractionDetailView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct FractionDetailView: View {
    var fraction: Fraction
    var body: some View {
        VStack(alignment: .leading) {
            Image(fraction.image)
                .resizable()
                .scaledToFit()
            Rectangle()
                .fill(fraction.color) // Set the line color
                            .frame(width: UIScreen.main.bounds.width * 3 / 4, height: 3) // Set width to 2/3 and height to 2
                        
            Text(fraction.displayName)
                .font(.custom("AbhayaLibre-Bold", size: 45, relativeTo: .title))
                .bold()
                .padding()
            Text(fraction.descriptionText)
                .font(.custom("AbhayaLibre-Regular", size: 20, relativeTo: .title))
                .padding() // Add some padding inside the text
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(fraction.color, lineWidth: 2) // Red border with rounded corners
                                )
        }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .ignoresSafeArea()
    }
}

#Preview {
    FractionDetailView(fraction: .Mafia)
}
                                          
