import Foundation
import SwiftData

struct Character: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var descriptionText: String
    var fraction: Fraction
    
    var image: String
}
