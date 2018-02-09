//
//  DevotionViewerScriptureTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 2/8/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class DevotionViewerScriptureTableViewCell: UITableViewCell {
    @IBOutlet weak var scriptureHeader: UILabel!
    @IBOutlet weak var scriptureSource: UILabel!
    @IBOutlet weak var scriptureText: UILabel!
    
    override func awakeFromNib() {
        setScriptureHeader()
    }
    
    func setScriptureHeader(){
        let fontSize = scriptureHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Scripture", withSize: fontSize)
        scriptureHeader.attributedText = formattedString
    }
    
    func setScriptureSource(fromPassage passage: String){
        let fontSize = scriptureHeader.font.pointSize
        let formattedString = NSMutableAttributedString()
        formattedString
            .italicize(passage, withSize: fontSize)
        scriptureSource.attributedText = formattedString
    }
}
