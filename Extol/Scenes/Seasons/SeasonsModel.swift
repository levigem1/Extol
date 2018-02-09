import Foundation

class SeasonsModel {
    var devotionsBySeason = [[Devotion]]()
    
    init() {
        devotionsBySeason = DevotionLoader.singleton.getDevotionsSortedBySeason()
    }
}


