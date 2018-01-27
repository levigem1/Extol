import Foundation
import UIKit

class HomePageViewController: UIViewController {
    let SEASONS = 0
    let EXTOL = 1
    let ARTISTS = 2
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        tabBar.selectedItem = tabBar.items?[EXTOL]
        backgroundImage.image = #imageLiteral(resourceName: "Stars")
        titleLabel.text = "Extol"
        welcomeLabel.text = "Welcome to Extel, a place where worship, scripture, and devotion collide."
        spotifyButton.setTitle("Spotify", for: .normal)
    }
    
}
