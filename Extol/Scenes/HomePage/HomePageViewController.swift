import Foundation
import UIKit

class HomePageViewController: UIViewController {
    let SEASONS = 0
    let EXTOL = 1
    let ARTISTS = 2
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    
    override func viewDidLoad() {
        backgroundImage.image = #imageLiteral(resourceName: "Stars")
        titleLabel.text = "Extol"
        welcomeLabel.text = "Welcome to Extol, a place where worship, scripture, and devotion collide."
        setHelpFont()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setHelpFont() {
        let fontSize = helpLabel.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .normal("Find your devotion by selecting ")
            .bold("Seasons", withSize: fontSize)
            .normal(" or ")
            .bold("Artists", withSize: fontSize)
            .normal(" below")
        
        helpLabel.attributedText = formattedString
    }
}

