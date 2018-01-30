import Foundation
import UIKit

enum Season {
    case wonder, thankfulness, grief, praise, solitude, fear
    
    var name: String {
        get {
            var nameString = String(describing: self)
            nameString.capitalizeFirstLetter()
            return nameString
        }
    }
    
    var image: UIImage {
        switch self {
        case .wonder:
            return #imageLiteral(resourceName: "WonderImage");
        case .thankfulness:
            return #imageLiteral(resourceName: "ThankfulnessImage")
        case .grief:
            return #imageLiteral(resourceName: "GriefImage")
        case .praise:
            return #imageLiteral(resourceName: "PraiseImage")
        case .solitude:
            return #imageLiteral(resourceName: "SolitudeImage")
        case .fear:
            return #imageLiteral(resourceName: "FearImage")
        }
    }
}
