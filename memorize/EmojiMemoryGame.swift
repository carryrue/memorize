//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344103 on 3/30/26.
//

import Foundation

@Observable

class EmojiMemoryGame{
    
    static var emojis: Array<String> = ["A","B","C","D","Z","T","P","H","O","M","Q","W","E","F","S","Y","🐮"]
    
    private static func createMemoryGame() -> memoryGame<String>{
        memoryGame<String>(numberOfParisOfCards:4,
                           createCardContent:{index in emojis[index]})
    }
    private var model : memoryGame<String>=createMemoryGame()
    
    var cards: [memoryGame<String>.Card] {
            model.cards
        
    }
    func choose(_ card: memoryGame<String>.Card){
        model.choose(card)
    }
    func shuffle(){
        model.shuffle()
    }
}
