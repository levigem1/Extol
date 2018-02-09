import Foundation
import UIKit

class DevotionViewerViewModel {
    var model:  DevotionViewerModel!
    init(model: DevotionViewerModel) {
        self.model = model
    }
    
    var devotion: Devotion {
        return model.devotion
    }
    
    var titleRow: Int {
        return 0
    }
    
    var lyricsRow: Int {
        return 1
    }
    
    var scriptureRow: Int {
        return 2
    }
    
    var devotionRow: Int {
        return 3
    }
    
    var backgroundColor: UIColor {
        return UIColor.black
    }
}

