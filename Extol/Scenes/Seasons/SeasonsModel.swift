import Foundation

class SeasonsModel {
    var devotionsBySeason = [[Devotion]]()
    
    init() {
        devotionsBySeason = ititializeDevotions()
    }
    
    private func ititializeDevotions() -> [[Devotion]] {
        let devotion1 = Devotion(withName: "Blessed", content: "God is good", forSeason: .joy)
        let devotion2 = Devotion(withName: "Trust", content: "God is faithful", forSeason: .joy)
        let devotion6 = Devotion(withName: "Faithfulness", content: "Woh", forSeason: .joy)
        let devotion7 = Devotion(withName: "Thankfulness", content: "Woh", forSeason: .joy)
        let devotion3 = Devotion(withName: "Faith", content: "God is strong", forSeason: .grief)
        let devotion4 = Devotion(withName: "Pixie Dust", content: "God is faithful", forSeason: .grief)
        let devotion5 = Devotion(withName: "Study", content: "Woh", forSeason: .learning)
        return [[devotion1, devotion2,devotion6,devotion7], [devotion3, devotion4], [devotion5]]
    }
}


