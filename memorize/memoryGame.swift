//
//  memoryGame.swift
//  memorize
//
//  Created by 11344103 on 3/30/26.
//

import Foundation

struct memoryGame<CardContent>{
    var cards:[Card]
    
    init(numberOfParisOfCards: Int,createCardContent: (Int) -> CardContent) {
        cards = []
        var cardContents: CardContent = createCardContent(index)
        for index in 0..<numberOfParisOfCards{
            cards.append(Card(content: cardContents))
            cards.append(Card(content: cardContents))
        }
    }
    
    func choose(_ card:Card){
        
    }
    struct Card{
        var isFaceUp:Bool = false
        var ismatched:Bool = false
        var content: CardContent
        
    }
}
