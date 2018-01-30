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
        return [[devotion1, devotion2,devotion3], [devotion4], [devotion5, devotion6], [devotion7, devotion8], [devotion9], [devotion10]]
    }
}


