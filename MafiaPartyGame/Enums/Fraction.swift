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
        case .Mafia: "Mafia is a group of bad guys"
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
