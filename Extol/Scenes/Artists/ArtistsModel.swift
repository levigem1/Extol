import Foundation

class ArtistsModel {
    var devotionsByArtist = [[Devotion]]()
    
    init() {
        devotionsByArtist = DevotionLoader.singleton.getDevotionsSortedByArtist()
    }
}



