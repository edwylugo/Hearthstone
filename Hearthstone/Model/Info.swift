//
//  Info.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation

class Info: Codable {
    let classes: [String]
    let types: [String]
    let races: [String]
    
    init(classes: [String], types: [String], races: [String]) {
        self.classes = classes
        self.types = types
        self.races = races
    }
}


