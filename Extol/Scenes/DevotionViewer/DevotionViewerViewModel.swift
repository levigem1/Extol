import Foundation

class DevotionViewerViewModel {
    var model:  DevotionViewerModel!
    init(model: DevotionViewerModel) {
        self.model = model
    }
    
    var devotion: Devotion {
        return model.devotion
    }
}

