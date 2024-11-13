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
    
    var displayName: String {
        String(describing: self)
    }
    
    var id: String {
        self.displayName
    }
}
