import Foundation

class DevotionViewerViewModel {
    var model:  DevotionViewerModel!
    init(model: DevotionViewerModel) {
        self.model = model
    }
    
    var devotions: Devotion {
        return model.devotion
    }
}

