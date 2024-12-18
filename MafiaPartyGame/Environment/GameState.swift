//
//  GameState.swift
//  MafiaPartyGame
//
//  Created by stud on 04/12/2024.
//

import Observation

@Observable class GameState {
    var players: [String: Player] = [:]
    var phase: Phase = .Day0
    
    var winner: Optional<Fraction> = Optional.none
    var inProgress: Bool {
        winner == Optional.none
    }
    
    func kill(playerId: String) {
        self.players[playerId]?.isAlive = false
    }
    
    func heal(playerId: String) -> Bool {
        var player = self.players[playerId].unsafelyUnwrapped
        var wasAlive = player.isAlive
        player.isAlive = true
        return !wasAlive
    }
    
    func newTurn() {
        self.phase = self.phase.next
        var countMafia = players.filter {key, player in player.character.fraction == .Mafia}.count
        if countMafia > players.count / 2 {
            self.winner = .Mafia
        }
        if countMafia == 1 && players.count == 2 {
            self.winner = .Mafia
        }
    }
    
}
