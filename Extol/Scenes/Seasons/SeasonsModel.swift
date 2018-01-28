import Foundation

class SeasonsModel {
    var devotionsBySeason = [[Devotion]]()
    
    init() {
        devotionsBySeason = ititializeDevotions()
    }
    
    private func ititializeDevotions() -> [[Devotion]] {
        let devotion1 = Devotion(withName: "Blessed", content: "God is good", forSeason: .joy)
        let devotion2 = Devotion(withName: "Trust", content: "God is faithful", forSeason: .joy)
        let devotion3 = Devotion(withName: "Faith", content: "God is strong", forSeason: .grief)
        let devotion4 = Devotion(withName: "Pixie Dust", content: "God is faithful", forSeason: .grief)
        return [[devotion1, devotion2], [devotion3, devotion4]]
    }
}


