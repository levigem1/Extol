import Foundation

class DevotionListModel {
    var devotions: [Devotion]!
    init(devotions: [Devotion]) {
        self.devotions = devotions.sorted(by: {$0.song < $1.song})
    }
}
