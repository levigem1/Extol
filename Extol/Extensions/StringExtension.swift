//
//  StringExtension.swift
//  Extol
//
//  Created by Levi Gemmell on 1/28/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

extension String {
    mutating func capitalizeFirstLetter() {
        self = self.prefix(1).uppercased() + dropFirst()
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String, withSize size: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: size)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func italicize(_ text: String, withSize size: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont.italicSystemFont(ofSize: size)]
        let italicString = NSMutableAttributedString(string:text, attributes: attrs)
        append(italicString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
