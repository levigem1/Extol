import Foundation

class DevotionListModel {
    var devotions = [Devotion]()
    init() {
        devotions = getAllDevotions()
    }
    
    private func getAllDevotions() -> [Devotion] {
        let devotion1 = Devotion(withName: "Blessed", content: "God is good")
        let devotion2 = Devotion(withName: "Trust", content: "God is faithful")
        return [devotion1, devotion2]
    }
}

