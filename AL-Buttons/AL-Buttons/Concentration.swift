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
    //QUESTION: when an array of Cards was initialized, what is the value of the identifier of each element??
    //TODO: check the identifer of each element in cards
    var cards = [Card]()
    
    var indexOfOnlyFaceUpCard: Int?
    //func <name>(<external name> <internal name>: <param type>) -> <return type>
    //model function to choose a card in the game
    //used by the viewcontroller to pass the index of the chosen card
    func chooseCard(at index: Int)
    {
        //check if card is not matched
        if !cards[index].isMatched
        {
            //check if there is only one face up card and
            //check if card to be chosen is not the same one as the one initially chosen (aka faceUpIndex != index)
            if let faceUpIndex = indexOfOnlyFaceUpCard, faceUpIndex != index
            {
                //check if cards match
                if cards[faceUpIndex].identifier == cards[index].identifier
                {
                    cards[faceUpIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                //default action is to flip up the card chosen at index
                //optionalInt indexOfOnlyFaceUpCard is unset because now there are 2 face up cards
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = nil
            }else{
                //either no card or 2 cards are face up
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for index in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
            //TOOD: for debugging only
            print(cards[index].identifier)
            print("number of pairs of cards \(numberOfPairsOfCards) & cards count is \(cards.count)")
        }
        
        //TODO: for debugging only
        for index in cards.indices
        {
            print("index is \(index) and valus is \(cards[index].identifier)")
        }
        
        //TODO: shuffle cards
        cards.shuffle()
    }
}




