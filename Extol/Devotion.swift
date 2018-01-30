import Foundation

class Devotion {
    var song: String = ""
    var artist: String = ""
    var lyrics: String = ""
 //   var lyricsURL: URL = UR
    var scriptureSource: String = ""
    var scriptureText: String = ""
    var devotionText: String = ""
    var season: Season?
    
    init(withName name: String, content: String, forSeason season: Season) {
        self.song = name
        self.devotionText = content
        self.season = season
    }
}
