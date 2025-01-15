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
        
    }
    @Test func doctorCantHealInNextTurn() async throws {
        
    }
    @Test func cattanisprawdzamafiejakomafia() async throws {
        
    }
    @Test func cattanimiasto() async throws {
        
    }
    @Test func jakmafiastrzelailekarznietrafitoumiera() async throws {
        
    }
    @Test func jaktasamaosobatoprzezywa() async throws {
        
    }
    @Test func jakmiastoglosuje() async throws {
        
    }
    @Test func jakjedenmafiajedenmiasta() async throws {
        
    }
    @Test func jedenmiastazeromafii() async throws {
        
    }
    @Test func mafiistrictewiecejnizmiasta() async throws {
        
    }

}
