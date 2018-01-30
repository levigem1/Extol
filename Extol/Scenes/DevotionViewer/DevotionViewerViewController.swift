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
    @IBOutlet weak var scriptureSource: UILabel!
    @IBOutlet weak var scriptureText: UILabel!
    @IBOutlet weak var devotionHeader: UILabel!
    @IBOutlet weak var devotionText: UILabel!
    
    override func viewDidLoad() {
        setDevotionTitle()
        setLyricsHeader()
        lyricsText.text = viewModel.devotion.lyrics
        fullLyricsLink.titleLabel?.text = "Full Lyrics"
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
    
    func setLyricsHeader(){
        let fontSize = lyricsHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Lyrics", withSize: fontSize)
        lyricsHeader.attributedText = formattedString
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
            UIApplication.shared.open(NSURL(string:"spotify:track:06TY7FCbeT7Lu39oZ0IEsN")! as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NSURL(string:"https://open.spotify.com/track/06TY7FCbeT7Lu39oZ0IEsN")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    func isSpotifyInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL(string:"spotify:")! as URL)
    }
    
    
}

