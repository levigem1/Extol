import Foundation

class SeasonsViewModel {
    var model: SeasonsModel!
    init (model: SeasonsModel) {
        self.model = model
    }
    
    var devotionsBySeason: [[Devotion]] {
        return model.devotionsBySeason
    }
}

