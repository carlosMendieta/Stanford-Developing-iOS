//
//  ViewController.swift
//  Concentration
//
//  Created by Carlos Mendieta on 1/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 { didSet{flipCountLabel.text = "Flips: \(flipCount)"}}
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func Reset(_ sender: UIButton) {
        flipCount = 0
        game.random()
        game.reset()
        updateViewFromModel()
    }
    @IBAction func TouchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("chosen card was not in cardButtons")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiTheme = [["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨"],
                      ["🐝","🐛","🦋","🐌","🐞","🐜","🦟","🦗","🕷"],
                      ["🐙","🦑","🦐","🦞","🦀","🐡","🐠","🐟","🐬"],
                      ["🦍","🐘","🦛","🦏","🐪","🦒","🦘","🐃","🦓"],
                      ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱"],
                      ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒"]]
    
    lazy var emojiChoices = emojiTheme[Int(arc4random_uniform(UInt32(emojiTheme.count)))]
    var emoji = [Int:String]()
    func randomRow()->Int{
        return Int(arc4random_uniform(UInt32(emojiTheme.count)))
    }
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

