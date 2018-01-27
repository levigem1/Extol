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
       // tabBar.delegate = self
       // tabBar.selectedItem = tabBar.items?[EXTOL]
        backgroundImage.image = #imageLiteral(resourceName: "Stars")
        titleLabel.text = "Extol"
        welcomeLabel.text = "Welcome to Extel, a place where worship, scripture, and devotion collide."
        spotifyButton.setTitle("Spotify", for: .normal)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func navigateToSeasons() {
        let seasonsStoryboard = UIStoryboard(name: "Seasons", bundle: nil)
        let seasonsViewController = seasonsStoryboard.instantiateViewController(withIdentifier: "SeasonsViewController")
        
        let navigationController = UINavigationController(rootViewController: seasonsViewController)
    }
}
/*
extension HomePageViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        guard let itemIndex = tabBar.items?.index(of: item) else { return }
        switch itemIndex {
        case SEASONS:
            navigateToSeasons()
        case EXTOL:
            break
        case ARTISTS:
            break
        default:
            return
        }
    }
}*/
