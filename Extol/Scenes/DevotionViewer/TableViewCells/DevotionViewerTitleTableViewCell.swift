//
//  DevotionViewTitleTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 2/8/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class DevotionViewerTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var devotionTitleHeaderLabel: UILabel!
    @IBOutlet weak var spotifyButton: UIButton!
    var spotifyURI: String?
    
    override func awakeFromNib() {
        setSpotifyButton()
    }
    
    func setDevotionTitle(forSongName songName: String, andArtist artist: String){
        let fontSize = devotionTitleHeaderLabel.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold(songName, withSize: fontSize)
            .normal(" - \(artist)")
        devotionTitleHeaderLabel.attributedText = formattedString
    }
    
    func setSpotifyButton() {
        spotifyButton.setTitle("Play", for: .normal)
        spotifyButton.layer.cornerRadius = 5
        spotifyButton.layer.borderWidth = 1
        spotifyButton.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func spotifyButtonPressed(_ sender: Any) {
        guard let spotifyURI = spotifyURI else { return }
        if isSpotifyInstalled() {
            UIApplication.shared.open(NSURL(string:"spotify:track:\(spotifyURI)")! as URL, options: [:], completionHandler: nil)
        } else {
            let spotifyLink = "https://open.spotify.com/track/\(spotifyURI)"
            UIApplication.shared.open(URL(string: spotifyLink)!)
        }
    }
    
    func isSpotifyInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL(string:"spotify:")! as URL)
    }
}
