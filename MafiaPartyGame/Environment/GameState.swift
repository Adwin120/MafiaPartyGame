//
//  GameState.swift
//  MafiaPartyGame
//
//  Created by stud on 04/12/2024.
//

import Observation
import Foundation

@Observable class GameState {
    var onWinConditionMet: ((Fraction) -> Void)?
    //var players: [String: Player] = [:]
    var players: [String: Player] =
    ["1": Player(id: "1", name: "Player 1", character: Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss")),
     "2": Player(id: "2", name: "Player 2", character: Character(id: 2, name: "Doctor", descriptionText: "lorem ipsum", fraction: .Town, image: "doctor")),
        "3": Player(id: "3", name: "Player 3", character: Character(id: 3, name: "Cattani", descriptionText: "lorem ipsum", fraction: .Town, image: "cattani")),]

    var playerList: [Player] {
        Array(players.values)
    }
    
    var phase: Phase = .NightMafia //initial phase is mafias turn I think?
    
    var winner: Optional<Fraction> = Optional.none
    var inProgress: Bool {
        winner == Optional.none
    }
    

    public func addPlayer(name: String, character: Character) {
        self.players[UUID().uuidString] = Player(id: UUID().uuidString, name: name, character: character)
    }

    public func newTurn() {
        print("New turn")
        ensureDead() // for doctor
        checkWinConditions()
        
        self.phase = self.phase.next
    }

    public func assassinate(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .Alive {
            player.status = .RecentlyDeceased
            self.players[playerId] = player
            print("Player \(player.name) has been assassinated")
            return true
            
        }
        return false
    }

    public func execute(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .Alive {
            player.status = .Deceased
            self.players[playerId] = player
            print("Player \(player.name) has been executed")
            
            // remove player from game
            self.players.removeValue(forKey: playerId)
            
            return true
        }
        return false
    }

    public func heal(playerId: String) -> Bool {
        if var player = self.players[playerId], player.status == .RecentlyDeceased {
            player.status = .Alive
            self.players[playerId] = player
            print("Player \(player.name) has been healed")
            return true
        }
        return false
    }

    private func checkWinConditions() {
            print("I check win conditions")
            var notDead = players.filter { _, player in player.status != .Deceased }
            var aliveMafiaCount = notDead.filter { _, player in player.character.fraction == .Mafia }.count

            if aliveMafiaCount == 0 {
                self.winner = .Town
                print("Town wins")
                
            }
            if aliveMafiaCount > notDead.count / 2 {
                self.winner = .Mafia
                print("Mafia wins")
                onWinConditionMet?(.Mafia)
            }
            if aliveMafiaCount == 1 && notDead.count == 2 {
                self.winner = .Mafia
                print("Mafia wins")
                onWinConditionMet?(.Mafia)
            }
        }

    private func ensureDead() {
        print(" I ensure dead")
        for (key, var player) in self.players {
            if player.status == .RecentlyDeceased {
                print("Found player to kill: \(player.name), id: \(player.id)")
                
                self.players.removeValue(forKey: key)
                
                //player.status = .Deceased
                //players[key] = player
            }
        }
    }
}
