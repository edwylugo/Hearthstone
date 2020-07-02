//
//  Card.swift
//  Hearthstone
//
//  Created by Edwy Lugo on 29/06/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation

class Card: Codable {
    var Basic: [Base?]
}

class Base: Codable {
    var cardId: String? = ""
    var dbfId: String? = ""
    var name: String? = ""
    var cardSet: String? = ""
    var type: String? = ""
    var faction: String? = ""
    var rarity: String? = ""
    var health: Int? = 0
    var collectible: Bool? = false
    var playerClass: String? = ""
    var img: String? = ""
    var imgGold: String? = ""
    var locale: String? = ""

}
