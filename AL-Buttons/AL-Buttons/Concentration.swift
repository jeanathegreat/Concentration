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
    {
        get
        {
            //optional flag to check if an index has been found
            //nil if index has not been found yet
            //set if index has been found, set to the value of the index found
            var indexFound: Int?
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if indexFound == nil{
                        indexFound = index
                    }else{
                        return nil
                    }
                }
            }
            return indexFound
        }
        
        //set(variable) where variable is the newvalue it was set
        //default name of "variable" is newValue
        set {
            for index in cards.indices{
                //expression on the right hand of equal sign evaluates to true if the index value during the loop iteration is equal to the value is it currently being set to
                //thus setting the faceup state of the card in that index to true
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
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
            }else{
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




