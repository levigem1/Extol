import Foundation
import UIKit

class HomePageViewController: UIViewController {
    let SEASONS = 0
    let EXTOL = 1
    let ARTISTS = 2
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        backgroundImage.image = #imageLiteral(resourceName: "Stars")
        titleLabel.text = "Extol"
        welcomeLabel.text = "Welcome to Extel, a place where worship, scripture, and devotion collide."
        self.navigationController?.navigationBar.isHidden = true
    }
}

