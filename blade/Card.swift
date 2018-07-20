//
//  Card.swift
//  blade
//
//  Created by mercury on 2018/7/20.
//  Copyright © 2018 udtrokia. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false;
    var isMatched = false;
    var identifier: Int;

    static var identifierFactory = 0;

    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1;
        return identifierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
}
