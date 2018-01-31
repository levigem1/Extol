import Foundation
import UIKit
import SafariServices

class DevotionViewerViewController: UIViewController, SFSafariViewControllerDelegate {
    var viewModel:  DevotionViewerViewModel!
    
    @IBOutlet weak var devotionTitle: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var lyricsHeader: UILabel!
    @IBOutlet weak var lyricsText: UILabel!
    @IBOutlet weak var fullLyricsLink: UIButton!
    @IBOutlet weak var scriptureHeader: UILabel!
    @IBOutlet weak var scriptureSource: UILabel!
    @IBOutlet weak var scriptureText: UILabel!
    @IBOutlet weak var devotionHeader: UILabel!
    @IBOutlet weak var devotionText: UILabel!
    
    override func viewDidLoad() {
        setDevotionTitle()
        setSpotifyButton()
        setLyricsHeader()
        lyricsText.text = viewModel.devotion.lyrics
        setFullLyricsButton()
        setScriptureHeader()
        setScriptureSource()
        scriptureText.text = viewModel.devotion.scriptureText
        setDevotionHeader()
        devotionText.text = viewModel.devotion.devotionText
    }
    
    func setDevotionTitle(){
        let fontSize = devotionTitle.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold(viewModel.devotion.song, withSize: fontSize)
            .normal(" - \(viewModel.devotion.artist)")
        devotionTitle.attributedText = formattedString
    }
    
    func setSpotifyButton() {
        spotifyButton.setTitle("Play", for: .normal)
        spotifyButton.layer.cornerRadius = 5
        spotifyButton.layer.borderWidth = 1
        spotifyButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func setLyricsHeader(){
        let fontSize = lyricsHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Lyrics", withSize: fontSize)
        lyricsHeader.attributedText = formattedString
    }
    
    func setFullLyricsButton(){
        let formattedString = NSMutableAttributedString()
        formattedString
            .underline("Full Lyrics")
        fullLyricsLink.setAttributedTitle(formattedString, for: .normal)
    }
    
    func setScriptureHeader(){
        let fontSize = scriptureHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Scripture", withSize: fontSize)
        scriptureHeader.attributedText = formattedString
    }
    
    func setScriptureSource(){
        let fontSize = scriptureHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .italicize(viewModel.devotion.scriptureSource, withSize: fontSize)
        scriptureSource.attributedText = formattedString
    }
    
    func setDevotionHeader(){
        let fontSize = devotionHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Devotion", withSize: fontSize)
        devotionHeader.attributedText = formattedString
    }
    
    @IBAction func spotifyButtonPressed(_ sender: Any) {
        if isSpotifyInstalled() {
            UIApplication.shared.open(NSURL(string:"spotify:track:\(self.viewModel.devotion.spotifyURI)")! as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NSURL(string:"https://open.spotify.com/track/\(self.viewModel.devotion.spotifyURI)")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    func isSpotifyInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL(string:"spotify:")! as URL)
    }
    
    @IBAction func fullLyricsButtonPressed(_ sender: Any) {
        if let lyricsWebsite = URL(string: viewModel.devotion.lyricsURL) {
            let safariVC = SFSafariViewController(url: lyricsWebsite)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        }
    }
}

