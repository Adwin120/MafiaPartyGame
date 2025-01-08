//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 08/01/2025.
//

struct Characters {
    static let all: [Character] = [
        Character(id: 1, name: "Don", descriptionText: "The head of the mafia. He can kill one person at night.", fraction: .Mafia, image: "mafiaBoss"),
        Character(id: 2, name: "Doctor", descriptionText: "He can save one person at night.", fraction: .Town, image: "doctor"),
        Character(id: 4, name: "Cattani", descriptionText: "He can check one person at night.", fraction: .Town, image: "cattani"),
    ]
}
