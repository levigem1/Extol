//
//  DevotionViewerLyricsTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 2/8/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class DevotionViewerLyricsTableViewCell: UITableViewCell {
    @IBOutlet weak var lyricsHeader: UILabel!
    @IBOutlet weak var lyricsText: UILabel!
    @IBOutlet weak var fullLyricsLink: UIButton!
    var lyricsLink: String?
    
    override func awakeFromNib() {
        setLyricsHeader()
        setFullLyricsButton()
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
    
    @IBAction func fullLyricsLinkPressed(_ sender: Any) {
        guard let lyricsLink = lyricsLink else { return }
        UIApplication.shared.open(URL(string: lyricsLink)!)
    }

    
}
