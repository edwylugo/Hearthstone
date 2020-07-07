//
//  Info.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation

public struct Info: Codable {
    let patch: String
    let classes: [String]
    let sets: [String]
    let types: [String]
    let factions: [String]
    let qualities: [String]
    let races: [String]
    let locales: [String]
    
    enum CodingKeys: String, CodingKey {
        case patch = "patch"
        case classes = "classes"
        case sets = "sets"
        case types = "types"
        case factions = "factions"
        case qualities = "qualities"
        case races = "races"
        case locales = "locales"
       }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        patch = try container.decode(String.self, forKey: .patch)
        classes = try container.decode([String].self, forKey: .classes)
        sets = try container.decode([String].self, forKey: .sets)
        types = try container.decode([String].self, forKey: .types)
        factions = try container.decode([String].self, forKey: .factions)
        qualities = try container.decode([String].self, forKey: .qualities)
        races = try container.decode([String].self, forKey: .races)
        locales = try container.decode([String].self, forKey: .locales)
    }
}


