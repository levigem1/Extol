import Foundation

class DevotionListViewModel {
    var model:  DevotionListModel!
    init(model: DevotionListModel) {
        self.model = model
    }
    
    var devotions: [Devotion] {
        return model.devotions
    }
}
