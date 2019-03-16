//
//  Card.swift
//  AL-Buttons
//
//  Created by JeanaTheGreat on 24/02/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    //"utility" vars
    static var makeCardIdentifier = 0
    
    //"utility" method
    //static function means this is a property of the type Card
    static func getUniqueIdentifer() -> Int
    {
        //Card.makeCardIdentifier += 1
        //no need to use "Card." since you are in a static function so
        //accessing static variables is allowed
        
        //QUESTION: what is the value of makeCardIdentifier every time a new type Card is instatiated???
        //TODO: debug this part
        makeCardIdentifier+=1
        return makeCardIdentifier
    }
    
    init()
    {
        //usage of the static function through type Card
        self.identifier = Card.getUniqueIdentifer()
    }
}
