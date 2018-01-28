import Foundation

class SeasonsViewModel {
    var model = SeasonsModel()
    
    var devotionsBySeason: [[Devotion]] {
        return model.devotionsBySeason
    }
}

