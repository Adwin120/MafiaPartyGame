//
//  Characters.swift
//  MafiaPartyGame
//
//  Created by Dominik Tomaszewski on 08/01/2025.
//

struct Characters {
    static let all: [Character] = [
        Character(id: 1, name: "Don", descriptionText: "The Mafia Boss is the cunning leader of the Mafia, orchestrating schemes and making critical decisions to ensure the group’s dominance. Charismatic and ruthless, the Boss uses strategy and manipulation to eliminate threats and secure victory.", fraction: .Mafia, image: "mafiaBoss"),
        Character(id: 2, name: "Doctor", descriptionText: "He can save one person at night.", fraction: .Town, image: "doctor"),
        Character(id: 4, name: "Cattani", descriptionText: "He can check one person at night.", fraction: .Town, image: "cattani"),
        Character(id: 5, name: "Citizen", descriptionText: "He can vote during the day.", fraction: .Town, image: "citizen"),
        Character(id: 6, name: "Gunshop", descriptionText: "He can kill one person at night.", fraction: .Syndicate, image: "gunshop"),
        Character(id: 7, name: "Blackmailer", descriptionText: "He can silence one person at night.", fraction: .Mafia, image: "blackmailer"),
        Character(id: 8, name: "Spy", descriptionText: "He can see who the mafia is at night.", fraction: .Syndicate, image: "lunatic"),
    ]
}
