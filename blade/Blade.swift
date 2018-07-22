//
//  Blade.swift
//  blade
//
//  Created by mercury on 2018/7/20.
//  Copyright © 2018 udtrokia. All rights reserved.
//

import Foundation

class Blade {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil;
                    }
                }
            }
            return foundIndex;
        }
        
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                }
                cards[index].isFaceUp = true;
            } else {
                // either no cards or 2 cards are faced up
                indexOfOneAndOnlyFaceUpCard = index;
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card();
            cards += [card, card];
        }
        // Shuffle
        for index in 1...numberOfPairsOfCards {
            let rand = Int(arc4random_uniform(UInt32(cards.count)));
            let tmp = cards[index];
            cards[index] = cards[rand];
            cards[rand] = tmp;
        }
    }
}
