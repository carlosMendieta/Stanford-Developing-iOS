//
//  Concentration.swift
//  Concentration
//
//  Created by Carlos Mendieta on 1/16/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation
class Concentration{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        random()
        //TODO: Shuffle the cards
    }
    func random(){
        cards.shuffle()
    }
    func reset(){
        for index in cards.indices{
            cards[index].isMatched = false
            cards[index].isFaceup = false
            indexOfOneAndOnlyFaceUpCard = nil
        }
    }
}

