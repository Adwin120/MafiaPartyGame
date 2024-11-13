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
        Text(fraction.displayName)
    }
}
