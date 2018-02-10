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
            let alreadyHasSection = addDevotionToExistingSectionIfPossible(devotion: devotion, devotionsByArtist: &devotionsByArtist)
            if alreadyHasSection == false {
                addDevotionToNewSection(devotion: devotion, devotionsByArtist: &devotionsByArtist)
            }
        }
        return devotionsByArtist
    }
    
    func addDevotionToNewSection(devotion: Devotion, devotionsByArtist: inout [[Devotion]]) {
        if let index = devotionsByArtist.index(where: { ($0.first?.artist) ?? "" > devotion.artist }) {
            devotionsByArtist.insert([devotion], at: index)
        } else {
            devotionsByArtist.append([devotion])
        }
    }
    
    func addDevotionToExistingSectionIfPossible(devotion: Devotion, devotionsByArtist: inout [[Devotion]])  -> Bool {
        for (index, devotionByArtist) in devotionsByArtist.enumerated() {
            if devotion.artist == devotionByArtist.first?.artist {
                devotionsByArtist[index].append(devotion)
                return true
            }
        }
        return false
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
        
        song = "White As Snow"
        artist = "Jon Foreman"
        lyrics = "Have mercy on me, oh God. \nAccording to Your unfailing love \nAccording to Your great compassion \nBlot out my transgressions"
        lyricsURL = "https://bethelmusic.com/chords-and-lyrics/reckless-love/"
        spotifyURI = "5BcupP5lvpJ7PeTNWejLzE"
        scriptureSource = "Psalm 51"
        scriptureText = "For I know my transgressions,\nand my sin is always before me"
        devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
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
        
        song = "King Of My Heart"
        artist = "John Mark McMillan"
        lyrics = "Let the King of my heart\nBe the mountain where I run\nThe fountain I drink from\nOh-oh, He is my song\nLet the King of my heart\nBe the shadow where I hide\nThe ransom for my life\nOh-oh, He is my song"
        lyricsURL = "http://www.worshiptogether.com/songs/king-of-my-heart-john-mark-mcmillan/"
        spotifyURI = "5OAHk4SXmhIjBhtLMVPllV"
        scriptureSource = "Psalm 73:26"
        scriptureText = "My flesh and my heart may fail, \nbut God is the strength of my heart and my portion forever."
        devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
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
