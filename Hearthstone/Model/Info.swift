//
//  Info.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation

public struct Info: Codable {
    let classes: [String]
    let types: [String]
    let races: [String]
    
    enum CodingKeys: String, CodingKey {
        case classes
        case types
        case races
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        classes = try container.decode([String].self, forKey: .classes)
        types = try container.decode([String].self, forKey: .types)
        races = try container.decode([String].self, forKey: .races)
    }
}


