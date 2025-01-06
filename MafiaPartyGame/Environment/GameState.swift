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

    public func newTurn() {
        checkWinConditions()
        // when the day ends doctor can't heal dead anymore, not sure if it's the correct moment in game to do this
        if phase == .Day0 || phase == .Day { 
            ensureDead()
        }       
        self.phase = self.phase.next
    }

    public func kill(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .Alive {
            player.status = .RecentlyDeceased
            self.players[playerId] = player 
            return true
        }
        return false
    }

    public func heal(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .RecentlyDeceased {
            player.status = .Alive
            self.players[playerId] = player 
            return true
        }
        return false
    }

    private func checkWinConditions() {
        var notDead = players.filter {_, player in player.status != .Deceased}
        var aliveMafiaCount = notDead.filter {_, player in player.character.fraction == .Mafia}.count

        if aliveMafiaCount == 0 {
            self.winner = .Town
        }
        if aliveMafiaCount > notDead.count / 2 {
            self.winner = .Mafia
        }
        if aliveMafiaCount == 1 && notDead.count == 2 {
            self.winner = .Mafia
        }
    }

    private ensureDead() {
        for (key, var player) in self.players {
            if player.status == .RecentlyDeceased {
                player.status = .Deceased
                gameState.players[key] = player
            }
        }
    }
}
