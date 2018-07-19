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
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)";
        }
    }
    
    var emojiChoices: Array<String> = ["🎃", "👻", "🎃", "👻"];
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    // action create method, outlet create property.
    @IBAction func touchCard(_ sender: UIButton) {
    // @IBAction is not part of a Swift method, a special directive that Xcode is putting in there.
        flipCount += 1;
        let cardNumber = cardButtons.index(of: sender)!
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender);
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
    // external name `withEmoji` with emoji internal name emoji. And the type is String.
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            if flipCount == 2 { print("congratulation!") }
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

