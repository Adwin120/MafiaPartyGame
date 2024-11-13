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
            NavigationLink(fraction.displayName, value: fraction).background(fraction.color)
        }
        .navigationDestination(for: Fraction.self) {
            fraction in FractionDetailView(fraction: fraction)
        }
    }
}

#Preview {
    NavigationStack {
        FractionsView()
    }
}
