//
//  GameState.swift
//  MafiaPartyGame
//
//  Created by stud on 04/12/2024.
//

import Observation

@Observable class GameState {
    var players: [Character] = []
    
    var winner: Optional<Fraction> = Optional.none
    var inProgress: Bool {
        winner == Optional.none
    }
}
