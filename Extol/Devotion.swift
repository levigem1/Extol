import Foundation
import UIKit

enum Season {
    case joy, grief, learning
    var name: String {
        get { return String(describing: self) }
    }
}

class Devotion {
    var name: String = ""
    var content: String = ""
    var season: Season?
    
    init(withName name: String, content: String, forSeason season: Season) {
        self.name = name
        self.content = content
        self.season = season
    }
}
