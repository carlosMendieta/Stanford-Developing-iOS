//
//  Card.swift
//  Concentration
//
//  Created by Carlos Mendieta on 1/16/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct Card {
    var isFaceup = false
    var isMatched = false
    var fliped = false
    var identifier: Int
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
