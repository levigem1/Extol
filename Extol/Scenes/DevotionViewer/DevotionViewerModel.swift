import Foundation

class DevotionViewerModel {
    var devotion: Devotion!
    init(devotion: Devotion) {
        self.devotion = devotion
        self.devotion.artist = "Jon Foreman"
        self.devotion.devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
        self.devotion.lyrics = "Have mercy on me, oh God. \nAccording to Your unfailing love \nAccording to Your great compassion \nBlot out my transgressions"
        self.devotion.scriptureSource = "Psalm 51"
        self.devotion.scriptureText = "For I know my transgressions,\nand my sin is always before me"
        self.devotion.song = "White As Snow"
        self.devotion.lyricsURL = "https://www.azlyrics.com/lyrics/jonforeman/whiteassnow.html"
        self.devotion.spotifyURI = "5BcupP5lvpJ7PeTNWejLzE"
    }
}
