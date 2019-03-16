//
//  Concentration.swift
//  AL-Buttons
//
//  Created by JeanaTheGreat on 24/02/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    //func <name>(<external name> <internal name>: <param type>) -> <return type>
    //model function to choose a card in the game
    func chooseCard(at index: Int)
    {
        //just flip the card over
        if cards[index].isFaceUp
        {
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        
        //TODO: shuffle cards
    }
}




