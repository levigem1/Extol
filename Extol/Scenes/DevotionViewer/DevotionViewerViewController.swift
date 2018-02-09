import Foundation
import UIKit
import SafariServices

class DevotionViewerViewController: UIViewController, SFSafariViewControllerDelegate {
    var viewModel:  DevotionViewerViewModel!
    
    @IBOutlet weak var devotionTableView: UITableView!
    
    
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
            let spotifyLink = "https://open.spotify.com/track/\(self.viewModel.devotion.spotifyURI)"
            launchSafariViewController(withUrlString: spotifyLink)
        }
    }
    
    func isSpotifyInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL(string:"spotify:")! as URL)
    }
    
    @IBAction func fullLyricsButtonPressed(_ sender: Any) {
            launchSafariViewController(withUrlString: viewModel.devotion.lyricsURL)
    }
    
    private func launchSafariViewController(withUrlString urlString: String) {
        if let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        }
    }
}

extension DevotionViewerViewController: UITableViewDelegate, UITableViewDataSource {
    
}
