import Foundation

class SeasonsModel {
    var devotionsBySeason = [[Devotion]]()
    
    init() {
        devotionsBySeason = ititializeDevotions()
    }
    
    private func ititializeDevotions() -> [[Devotion]] {
        let devotion1 = Devotion(withName: "Blessed", content: "God is good", forSeason: .wonder)
        let devotion2 = Devotion(withName: "Trust", content: "God is faithful", forSeason: .wonder)
        let devotion3 = Devotion(withName: "Faithfulness", content: "Woh", forSeason: .wonder)
        let devotion4 = Devotion(withName: "Thankfulness", content: "Woh", forSeason: .thankfulness)
        let devotion5 = Devotion(withName: "Faith", content: "God is strong", forSeason: .grief)
        let devotion6 = Devotion(withName: "Pixie Dust", content: "God is faithful", forSeason: .grief)
        let devotion7 = Devotion(withName: "Study", content: "Woh", forSeason: .praise)
        let devotion8 = Devotion(withName: "Study", content: "Woh", forSeason: .praise)
        let devotion9 = Devotion(withName: "Study", content: "Woh", forSeason: .solitude)
        let devotion10 = Devotion(withName: "Study", content: "Woh", forSeason: .fear)
        devotion1.artist = "Jon Foreman"
        devotion1.devotionText = "We mess up. Daily. If we were to try out of our own strength to be holy and to please our God, we would fail every time. Thankfully, we serve a God who does the work for us. He makes our brokenness beautiful and separates us from our sin. He teaches us to delight in holiness. When our faith becomes lifeless and weak and we're far from Him, He reminds us of the incredible joy of His salvation. When guilt and shame are crippling, He covers us in forgiveness. The only sacrifice He wants  is for us to come before Him with a broken spirit and repentant heart. If we truly desire change, He will work in us.  Regardless of where we've been or what we've done, the Lord can and will create clean hearts in us, He will erase all of our sins, and He will always cover us in His unfailing mercy and compassion. Praise Him, because turns our broken lives into beautiful creations!"
        devotion1.lyrics = "Have mercy on me, oh God. \nAccording to Your unfailing love \nAccording to Your great compassion \nBlot out my transgressions"
        devotion1.scriptureSource = "Psalm 51"
        devotion1.scriptureText = "For I know my transgressions,\nand my sin is always before me"
        devotion1.song = "White As Snow"
        devotion1.lyricsURL = "https://www.azlyrics.com/lyrics/jonforeman/whiteassnow.html"
        devotion1.spotifyURI = "5BcupP5lvpJ7PeTNWejLzE"
        return [[devotion1, devotion2,devotion3], [devotion4], [devotion5, devotion6], [devotion7, devotion8], [devotion9], [devotion10]]
    }
}


