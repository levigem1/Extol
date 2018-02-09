//
//  ExtolTableViewCell.swift
//  Extol
//
//  Created by Levi Gemmell on 1/18/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class ExtolTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subText: UILabel!
    
    override func awakeFromNib() {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView =  view
    }
    
    override func prepareForReuse() {
        title.text = ""
        subText.text = ""
    }
}
