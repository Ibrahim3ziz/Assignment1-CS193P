//
//  Concentration.swift
//  Assignment-1
//
//  Created by Ibrahim Abdul Aziz on 4/11/20.
//  Copyright © 2020 Ibrahim Abdul Aziz. All rights reserved.
//

import Foundation

class Concentration {
    
   // MARK: Variables
    private(set) var cards = [Card]()
    private(set) var seenCards: Set<Int> = []
    private(set) var score = 0
    private(set) var flips = 0
    
    private var indexOfOneAndOnly: Int? {
        get {
            return cards.indices.filter { cards[$0].isFacedUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    // MARK: Functions
     func newGame() {
        score = 0
        flips = 0
        cards.shuffle()
    }
    
   
     func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): choosen index")
        
        
        if cards[index].isMatched {
            return
        }
        
        if indexOfOneAndOnly != index  {
            flips += 1
        }
        if let matchIndex = indexOfOneAndOnly, matchIndex != index {

            if cards[matchIndex] == cards[index] {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true

                score += Points.matchingFirstTime
            }
            else {
                if (seenCards.contains(index) || seenCards.contains(matchIndex)) {
                    score -= Points.matchingSecondTime
                }
            }
            
            seenCards.insert(index)
            seenCards.insert(matchIndex)
                          
            cards[index].isFacedUp = true
        }
        else {
            indexOfOneAndOnly = index
        }
    }
    
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init\(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        
    }
    
    
    private struct Points {
        static let matchingFirstTime = 2
        static let matchingSecondTime = 1
    }

}

