import Foundation

enum Season {
    case joy, grief, learning
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
