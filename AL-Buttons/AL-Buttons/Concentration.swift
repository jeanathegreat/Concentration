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
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
    }
}


