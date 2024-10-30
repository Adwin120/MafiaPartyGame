import Foundation
import SwiftData

@Model
final class Character {
    var name: String
    var descriptionText: String
    var fraction: Fraction
    
    // TODO change to proper data type
    var image: String
    
    init(name: String, descriptionText: String, image: String, fraction: Fraction) {
        self.name = name
        self.descriptionText = descriptionText
        self.image = image
        self.fraction = fraction
    }
}
