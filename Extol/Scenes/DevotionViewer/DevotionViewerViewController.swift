import Foundation
import UIKit

class DevotionViewerViewController: UIViewController {
    var viewModel:  DevotionViewerViewModel!
    
    @IBOutlet weak var devotionTitle: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var lyricsHeader: UILabel!
    @IBOutlet weak var lyricsText: UILabel!
    @IBOutlet weak var fullLyricsLink: UIButton!
    @IBOutlet weak var scriptureHeader: UILabel!
    @IBOutlet weak var scripturePassage: UILabel!
    @IBOutlet weak var scriptureText: UILabel!
    @IBOutlet weak var devotionHeader: UILabel!
    @IBOutlet weak var devotionText: UILabel!
    
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

