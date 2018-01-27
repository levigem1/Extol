import Foundation
import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    
    override func viewDidLoad() {
        backgroundImage.image = #imageLiteral(resourceName: "Stars")
        titleLabel.text = "Extol"
        welcomeLabel.text = "Welcome to Extel, a place where worship, scripture, and devotion collide."
        spotifyButton.setTitle("Spotify", for: .normal)
    }
    
}
