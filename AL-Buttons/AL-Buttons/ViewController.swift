//
//  ViewController.swift
//  AL-Buttons
//
//  Created by JeanaTheGreat on 24/02/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //lazy is a property given to a variable meaning it is not initialized
    //yet until it has to be used
    //this solves the problem of interdependency on variables that need
    //to be initialized first before using the other
    //the thing is this cannot use a property obeserver like didSet, etc.
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCounter: Int = 0
    {
        //property oberver: called every time this object's value is set
        //need to read more on this
        didSet{
            flipCountLabel.text = "Flips: \(flipCounter)"
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //action that connects to a model function game.chooseCard
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.lastIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
            //since something might change in the game
            updateViewFromModel()
        }else{
            print("chosen card was not in cardbuttons")
        }
        flipCounter+=1
    }
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            //look for button at that index
            let button = cardButtons[index]
            //look for card in the cards array of the game model at that index
            let card = game.cards[index]
            if card.isFaceUp
            {
                //flip the up down if card was face up
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                //
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 0) : #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojiChoices = ["🐛","🐸","🐞","🦐","🐝","🐜","🍭","🎃","🥗","🌮","🍕"]
    var emojiDictionary = [Int:String]()
    //optional way to declare it
    //var emojiDictionary =
    
    func emoji(for card: Card) -> String
    {
        //create emoji dictionary from array of emojiChoices AMD
        //check if emojiChoices still has emojis in its array
        if emojiDictionary[card.identifier] == nil, emojiChoices.count > 0 {
            //generate random index from the number of strings in emojiChoices array
            let randInt = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randInt)
        }
        
        //return optional string but if nil return ">"
        return emojiDictionary[card.identifier] ?? "?"
    }
}

