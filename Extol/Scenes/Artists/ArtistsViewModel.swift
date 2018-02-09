import Foundation

class ArtistsViewModel {
    var model = ArtistsModel()
    
    var devotionsByArtist: [[Devotion]] {
        return model.devotionsByArtist
    }
}


