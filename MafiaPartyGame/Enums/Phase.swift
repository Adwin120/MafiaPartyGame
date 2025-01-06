//
//  Phase.swift
//  MafiaPartyGame
//
//  Created by stud on 18/12/2024.
//

enum Phase: Hashable, Codable {
    case Day
    case NightMafia
    case NightDetective
    case NightDoctor
    
    var next: Phase {
        switch self {
        case .Day: .NightMafia
        case .NightMafia: .NightDetective
        case .NightDetective: .NightDoctor
        case .NightDoctor: .Day
        }
    }
}
