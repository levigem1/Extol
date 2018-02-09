import Foundation

class ArtistsModel {
    var devotionsByArtist = [[Devotion]]()
    
    init() {
        devotionsByArtist = ititializeDevotions()
    }
    
    private func ititializeDevotions() -> [[Devotion]] {
        let devotion1 = getDevotionWithArtist(artist: "Jon Foreman", song: "White as Snow", andSeason: .wonder)
        let devotion2 = getDevotionWithArtist(artist: "Jon Foreman", song: "Meant To Live", andSeason: .wonder)
        let devotion3 = getDevotionWithArtist(artist: "Jon Foreman", song: "Patron Saint Of Rock n' Roll", andSeason: .wonder)
        let devotion4 = getDevotionWithArtist(artist: "Kim Walker", song: "Spontaneous 2", andSeason: .thankfulness)
        let devotion5 = getDevotionWithArtist(artist: "Hillsong", song: "Inside Out", andSeason: .grief)
        let devotion6 = getDevotionWithArtist(artist: "Hillsong", song: "Our God", andSeason: .grief)
        let devotion7 = getDevotionWithArtist(artist: "Kari Jobe", song: "Praise Him", andSeason: .praise)
        let devotion8 = getDevotionWithArtist(artist: "Kari Jobe", song: "Lift Him Higher", andSeason: .praise)
        let devotion9 = getDevotionWithArtist(artist: "Bethel", song: "Pieces", andSeason: .solitude)
        let devotion10 = getDevotionWithArtist(artist: "Cory Asbury", song: "Reckless Love", andSeason: .fear)

        return [[devotion1, devotion2,devotion3], [devotion4], [devotion5, devotion6], [devotion7, devotion8], [devotion9], [devotion10]]
    }
    
    private func getDevotionWithArtist(artist: String, song: String, andSeason season: Season) -> Devotion{
        let devotion = Devotion(withSong: song, artist: artist, lyrics: "Have mercy on me, oh God. \nAccording to Your unfailing love \nAccording to Your great compassion \nBlot out my transgressions", lyricsURL: "https://www.azlyrics.com/lyrics/jonforeman/whiteassnow.html", spotifyURI: "5BcupP5lvpJ7PeTNWejLzE", scriptureSource: "Psalm 51", scriptureText: "For I know my transgressions,\nand my sin is always before me", devotionText: "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!", forSeason: season)
        return devotion
    }
}



