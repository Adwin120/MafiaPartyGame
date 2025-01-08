import SwiftUICore
enum Fraction: Hashable, Codable, Identifiable {
    case Mafia
    case Town
    case Syndicate
    
    var color: Color {
        switch self {
        case .Mafia: Color.red
        case .Town: Color.yellow
        case .Syndicate: Color.blue
        }
    }
    
    var image: String {
        switch self {
        case .Mafia: "mafiaBoss"
        case .Town: "doctor"
        case .Syndicate: "syndicate"
        }
    }
    
    var descriptionText: String {
        switch self {
        case .Mafia: "The Mafia group consists of covert operatives working together to eliminate other factions and take control of the game. Their strength lies in deception, strategy, and secrecy as they attempt to outwit and outmaneuver opponents while blending in with the crowd. Trust no one—especially the Mafia."
        case .Town: "Town is a group of good guys"
        case .Syndicate: "Syndicate is a group of neutral guys"
        }
    }
    
    var displayName: String {
        String(describing: self)
    }
    
    var id: String {
        self.displayName
    }
}
