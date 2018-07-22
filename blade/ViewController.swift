//
//  ViewController.swift
//  blade
//
//  Created by mercury on 2018/7/18.
//  Copyright © 2018 udtrokia. All rights reserved.
//

import UIKit
// import all UIIKit, iOS
// Cocoa Touch Layer


class ViewController: UIViewController {
// ViewController => link UI layer name, if you want change, change both of them
// UIViewController father class
    
    var numberOfParisOfCards: Int {
        return (cardButtons.count + 1) / 2;
    }
    
    lazy var game = Blade(numberOfPairsOfCards: numberOfParisOfCards);
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)";
        }
    }
    
    var emojiChoices = ["🎃", "👻", "🦅", "🦄", "🐬"];
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)));
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex);
        }
        return emoji[card.identifier] ?? "?";
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    // action create method, outlet create property.
    @IBAction func touchCard(_ sender: UIButton) {
    // @IBAction is not part of a Swift method, a special directive that Xcode is putting in there.
        flipCount += 1;
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber);
            updateViewFromMode();
        } else {
            print("chosen card was not in cardButtons");
        }
    }
    
    func updateViewFromMode() {
        for index in cardButtons.indices {
            let button = cardButtons[index];
            let card = game.cards[index];
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
}

