//
//  StringExtension.swift
//  Extol
//
//  Created by Levi Gemmell on 1/28/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation

extension String {
    mutating func capitalizeFirstLetter() {
        self = self.prefix(1).uppercased() + dropFirst()
    }
}
