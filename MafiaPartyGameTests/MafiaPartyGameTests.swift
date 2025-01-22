//
//  MafiaPartyGameTests.swift
//  MafiaPartyGameTests
//
//  Created by Dominik Tomaszewski on 23/10/2024.
//

import Testing
@testable import MafiaPartyGame

struct MafiaPartyGameTests {

    @Test func doctorCanHealAssasinatedPlayer() async throws {
        let gameState = GameState()
        #expect(gameState.assassinate(playerId: "1"))
        #expect(gameState.players["1"]?.status == .RecentlyDeceased)
        #expect(gameState.heal(playerId: "1"))
        #expect(gameState.players["1"]?.status == .Alive)
        
    }
    @Test func doctorCantHealExecutedPlayer() async throws {
        let gameState = GameState()
        #expect(gameState.execute(playerId: "1"))
        #expect(gameState.players["1"] == Some.none) // expect not to be there
        #expect(!gameState.heal(playerId: "1"))
    }
    @Test func doctorCantHealInNextTurn() async throws {
        let gameState = GameState()

        gameState.assassinate(playerId: "1")
        gameState.newTurn()
        
        #expect(gameState.players["1"] == Optional.none) // expect not to be there
        #expect(!gameState.heal(playerId: "1"))
    }
    // @Test func cattanisprawdzamafiejakomafia() async throws {
        
    // }
    // @Test func cattanimiasto() async throws {
        
    // }
    @Test func thePlayerDiesWhenDoctorMisses() async throws {
        let gameState = GameState()
        #expect(gameState.assassinate(playerId: "1"))
        #expect(gameState.players["1"]?.status == .RecentlyDeceased)
        #expect(gameState.heal(playerId: "2"))
        gameState.nextTurn()
        #expect(gameState.players["1"]?.status == .Deceased)
    }
    @Test func winConditionOneMafiaOneTown() async throws {
        let gameState = GameState()
        gameState.execute(playerId: "2")
        gameState.nextTurn()
        #expect(gameState.winner = Optional.some(.Mafia))
    }
    @Test func winConditionZeroMafia() async throws {
        let gameState = GameState()
        gameState.execute(playerId: "1")
        gameState.nextTurn()
        #expect(gameState.winner == Optional.some(.Town))
    }
    @Test func winConditionMoreMafiaThanTown() async throws {
        let gameState = GameState()
        gameState.addPlayer("mafia crook", Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss"))
        gameState.addPlayer("mafia crook2", Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss"))
        
        gameState.nextTurn()

        #expect(gameState.winner == Optional.some(.Mafia))
    }

}
