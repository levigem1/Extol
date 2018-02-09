//
//  DevotionViewerDevotionTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 2/8/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class DevotionViewerDevotionTableViewCell: UITableViewCell {
    @IBOutlet weak var devotionHeader: UILabel!
    @IBOutlet weak var devotionText: UILabel!
    
    override func awakeFromNib() {
        setDevotionHeader()
    }
    
    func setDevotionHeader(){
        let fontSize = devotionHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Devotion", withSize: fontSize)
        devotionHeader.attributedText = formattedString
    }
}

