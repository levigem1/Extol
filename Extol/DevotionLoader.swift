import Foundation

class DevotionLoader {
    public static var singleton = DevotionLoader()
    var devotions: [Devotion] = [Devotion]()
    
    func getDevotionsSortedBySeason() -> [[Devotion]] {
        let wonderDevotions = devotions.filter { $0.season == .wonder }
        let thankfulnessDevotions = devotions.filter { $0.season == .thankfulness }
        let griefDevotions = devotions.filter { $0.season == .grief }
        let praiseDevotions = devotions.filter { $0.season == .praise }
        let solitudeDevotions = devotions.filter { $0.season == .solitude }
        let fearDevotions = devotions.filter { $0.season == .fear }
        return [wonderDevotions, thankfulnessDevotions, griefDevotions, praiseDevotions, solitudeDevotions, fearDevotions]
    }
    
    func getDevotionsSortedByArtist() -> [[Devotion]] {
        var devotionsByArtist = [[Devotion]]()
        for devotion in devotions {
            var foundMatch = false
            for (index, devotionByArtist) in devotionsByArtist.enumerated() where foundMatch == false {
                if devotion.artist == devotionByArtist.first?.artist {
                    devotionsByArtist[index].append(devotion)
                    foundMatch = true
                }
            }
            if foundMatch == false {
                devotionsByArtist.append([devotion])
            }
        }
        return devotionsByArtist
    }
    
    func loadAllDevotions() {
        var song: String = ""
        var artist: String = ""
        var lyrics: String = ""
        var lyricsURL: String = ""
        var spotifyURI: String = ""
        var scriptureSource: String = ""
        var scriptureText: String = ""
        var devotionText: String = ""
        var season: Season!
        
        song = "Reckless Love"
        artist = "Cory Asbury"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
        season = .wonder
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "So Good To Me"
        artist = "Cory Asbury"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
        season = .grief
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "House Of God"
        artist = "Jon Foreman"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "Great devo"
        season = .grief
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "Praise"
        artist = "Kari Jobe"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "Great devotion!"
        season = .fear
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "Praise"
        artist = "Kari Jobe"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "Great devotion!"
        season = .solitude
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "Praise"
        artist = "Kari Jobe"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "Great devotion!"
        season = .thankfulness
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
        
        song = "Praise God"
        artist = "Hillsong"
        lyrics = "Before I spoke a word,\nYou were singing over me\nYou have been so, so good to me"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "0rH0mprtecH3grD9HFM5AD"
        scriptureSource = "Luke 15"
        scriptureText = "'My son', the father said,\n‘you are always with me,\nand everything I have is yours'"
        devotionText = "Great devotion!"
        season = .praise
        
        addDevotion(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText, season: season)
    }
    
    private func addDevotion(song: inout String, artist: inout String, lyrics: inout String, lyricsURL: inout String, spotifyURI: inout String, scriptureSource: inout String, scriptureText: inout String, devotionText: inout String, season: Season)  {
        let devotion = Devotion(withSong: song, artist: artist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        devotions.append(devotion)
        clearAllFields(song: &song, artist: &artist, lyrics: &lyrics, lyricsURL: &lyricsURL, spotifyURI: &spotifyURI, scriptureSource: &scriptureSource, scriptureText: &scriptureText, devotionText: &devotionText)
    }
    
    private func clearAllFields(song: inout String, artist: inout String, lyrics: inout String, lyricsURL: inout String, spotifyURI: inout String, scriptureSource: inout String, scriptureText: inout String, devotionText: inout String) {
        song = ""
        artist = ""
        lyrics = ""
        lyricsURL = ""
        spotifyURI = ""
        scriptureSource = ""
        scriptureText = ""
        devotionText = ""
    }
}
