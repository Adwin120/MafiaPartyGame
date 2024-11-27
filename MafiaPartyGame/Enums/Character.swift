import Foundation
import SwiftData

struct Character: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var descriptionText: String
    var fraction: Fraction
    
    var image: String
}

//character example
extension Character {
    static let example = Character(id: 1, name: "Mafia Boss", descriptionText: "lorem ipsum", fraction: .Mafia, image: "mafiaBoss")
}
