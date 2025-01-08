//
//  FractionsView.swift
//  MafiaPartyGame
//
//  Created by stud on 13/11/2024.
//

import SwiftUI

struct FractionsView: View {
    
    @State var fractions: [Fraction] = [
        .Mafia, .Town
    ]
    
    var body: some View {
        List(fractions) {fraction in
            if fraction == .Mafia {
                ZStack {
                    Image("mafiaBoss")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .overlay(Color.black.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(fraction.color, lineWidth: 2))
                    
                    NavigationLink(value: fraction) {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(fraction.displayName)
                                .font(.custom("AbhayaLibre-Bold", size: 42, relativeTo: .title))
                                .bold()
                                .foregroundColor(.white)
                            
                        }
                    }.padding()
                }
                
            } else if fraction == .Town { // Town
                ZStack {
                    Image("doctor")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .overlay(Color.black.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(fraction.color, lineWidth: 2))
                    
                    NavigationLink(value: fraction) {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(fraction.displayName)
                                .font(.custom("AbhayaLibre-Bold", size: 42, relativeTo: .title))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
            }
            
        }
        
        .navigationDestination(for: Fraction.self) {
            fraction in FractionDetailView(fraction: fraction)
        }
        .listStyle(.inset)
        .navigationTitle("Fractions")
    }
}

#Preview {
    NavigationStack {
        FractionsView()
    }
}
