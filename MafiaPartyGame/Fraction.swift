import SwiftUICore
enum Fraction: Codable {
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
}
