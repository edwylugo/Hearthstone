//
//  UIColorRandom.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 01/07/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...0.58),
                       green: .random(in: 0...0.58),
                       blue: .random(in: 0...0.58),
                       alpha: 1.0)
    }
    
}
