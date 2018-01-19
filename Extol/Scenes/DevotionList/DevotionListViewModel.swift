import Foundation

class DevotionListViewModel {
    var model =  DevotionListModel()
    init() {
    }
    
    var devotions: [Devotion] {
        return model.devotions
    }
}
