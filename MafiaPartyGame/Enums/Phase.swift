//
//  Phase.swift
//  MafiaPartyGame
//
//  Created by stud on 18/12/2024.
//

enum Phase: Hashable, Codable {
    case Day
    case Night
    case Day0
    case Night0
    
    var next: Phase {
        switch self {
        case .Day0: .Night0
        case .Night0: .Day
        case .Day: .Night
        case .Night: .Day
        }
    }
}
