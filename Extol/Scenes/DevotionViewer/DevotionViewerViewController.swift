import Foundation
import UIKit

class DevotionViewerViewController: UIViewController {
    var viewModel:  DevotionViewerViewModel!
    
    @IBOutlet weak var spotifyButton: UIButton!
    
    override func viewDidLoad() {
       
    }
    
    @IBAction func spotifyButtonPressed(_ sender: Any) {
        if isSpotifyInstalled() {
            UIApplication.shared.open(NSURL(string:"spotify:track:06TY7FCbeT7Lu39oZ0IEsN")! as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NSURL(string:"https://open.spotify.com/track/06TY7FCbeT7Lu39oZ0IEsN")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    func isSpotifyInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL(string:"spotify:")! as URL)
    }
    
    
}

