//
//  ViewController.swift
//  AL-Buttons
//
//  Created by JeanaTheGreat on 24/02/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    var emojiChoices = ["🐛","🐸","🐞","🦐","🐝","🐜"]
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchFirstCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.lastIndex(of: sender)
        {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("chosen card was not in cardbuttons")
        }
        flipCounter+=1
    }
    
    //function to flip the card upon clicking button
    //changes button background according to its flip state
    //Green for face down cards and white for face up cards
    func flipCard (withEmoji emoji: String, on button: UIButton)
    {
        if button.currentTitle == emoji
        {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

