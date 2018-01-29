//
//  TableViewExtension.swift
//  Extol
//
//  Created by Levi Gemmell on 1/28/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func scrollToTop() {
        self.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func correctContentInset() {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
