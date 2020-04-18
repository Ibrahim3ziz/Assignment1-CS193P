//
//  ViewController.swift
//  Assignment-1
//
//  Created by Ibrahim Abdul Aziz on 4/11/20.
//  Copyright © 2020 Ibrahim Abdul Aziz. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {
    
   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    lazy var currentTheme: themes = .default_Theme
    private var emoji = [Card: String]()
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    private var visibleCardButtons: [UIButton]! {
        
        return cardButtons!.filter {!$0.superview!.isHidden}
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        // Get the index of the touched card
        if let cardNumber = visibleCardButtons.firstIndex(of: sender) {
        // Tell the model which card was chosen
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("The chosen card was not in visibleCardButtons")
        }
    }
    
    @IBAction func newGameButtonTouched(_ sender: UIButton) {
        newGame()
        initalSetup()
    }
    
    var numberOfPairsOfCards: Int {
        return (visibleCardButtons.count + 1) / 2
    }
    
    
    
    // MARK: Functions
    
    private func updateViewFromModel(){
        scoreLabel.text = "SCORE:\(game.score)"
        flipCountLabel.text = "FLIPS: \(game.flips)"
        
        for index in visibleCardButtons.indices {
            let button = visibleCardButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : currentTheme.theme.cardColor
            }
        }
        
    }
    

    
    private func newGame() {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        game.newGame()
    }
    
    private func mapEmojisToCards(){
        var emojis = currentTheme.theme.emoji
        emojis.shuffle()
        for card in game.cards {
            if !emojis.isEmpty, emoji[card] != nil {
                emoji[card] = emojis.removeFirst()
            }
            else {
                emoji[card] = "?"
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        return emoji[card] ?? "?"
        
    }
    
    private func initalSetup() {
        newGame()
        mapEmojisToCards()
        updateViewFromModel()
        self.view.backgroundColor = currentTheme.theme.backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }


}

 
