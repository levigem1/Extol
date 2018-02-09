//
//  DevotionTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 1/18/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class DevotionTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    override func awakeFromNib() {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView =  view
    }
    
    override func prepareForReuse() {
        name.text = ""
        artist.text = ""
    }
}
