//
//  Player.swift
//  MafiaPartyGame
//
//  Created by stud on 04/12/2024.
//

struct Player: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var character: Character
    var status: PlayerAliveState = .Alive
}
