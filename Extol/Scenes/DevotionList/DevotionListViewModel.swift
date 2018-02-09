import Foundation
import UIKit

class DevotionListViewModel {
    var model:  DevotionListModel!
    var headerTitle: String?
    var headerImage: UIImage?
    
    init(model: DevotionListModel) {
        self.model = model
    }
    
    var devotions: [Devotion] {
        return model.devotions
    }
}
