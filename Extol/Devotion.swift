import Foundation

class Devotion {
    var song: String = ""
    var artist: String = ""
    var lyrics: String = ""
    var lyricsURL: String = ""
    var spotifyURI: String = ""
    var scriptureSource: String = ""
    var scriptureText: String = ""
    var devotionText: String = ""
    var season: Season?
    
    init(withSong song: String, artist: String, lyrics: String, lyricsURL: String, spotifyURI: String, scriptureSource: String, scriptureText: String, devotionText: String, forSeason season: Season) {
        self.song = song
        self.artist = artist
        self.lyrics = lyrics
        self.lyricsURL = lyricsURL
        self.spotifyURI = spotifyURI
        self.scriptureSource = scriptureSource
        self.scriptureText = scriptureText
        self.devotionText = devotionText
        self.season = season
    }
}
