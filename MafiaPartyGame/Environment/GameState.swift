//
//  GameState.swift
//  MafiaPartyGame
//
//  Created by stud on 04/12/2024.
//

import Observation

@Observable class GameState {
    var players: [String: Player] = [:]

    var playerList: [Player] {
        Array(players.values)
    }
    
    var phase: Phase = .NightMafia //initial phase is mafias turn I think?
    
    var winner: Optional<Fraction> = Optional.none
    var inProgress: Bool {
        winner == Optional.none
    }

    public func newTurn() {
        checkWinConditions()
        if phase == .NightDoctor { // after doctors turn
            ensureDead()
        } 
        self.phase = self.phase.next
    }

    public func Assassinate(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .Alive {
            player.status = .RecentlyDeceased
            self.players[playerId] = player 
            return true
        }
        return false
    }

    public func Execute(playerId: String) -> {
        if var player = self.players[playerId], player.status == .Alive {
            player.status = .Deceased
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
