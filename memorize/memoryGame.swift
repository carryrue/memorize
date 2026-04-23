//
//  memoryGame.swift
//  memorize
//
//  Created by 11344103 on 3/30/26.
//

import Foundation


struct memoryGame<CardContent> where CardContent: Equatable{
    var cards:[Card]
    var score=0
    init(numberOfParisOfCards: Int,createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfParisOfCards{
            let cardContents: CardContent = createCardContent(index)
            cards.append(Card(content: cardContents,id: "\(index)a"))
            cards.append(Card(content: cardContents,id: "\(index)b"))
        }
        shuffle()
    }
    var lastFaceUpIndex : Int?
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card) {
            
            if let lastIndex = lastFaceUpIndex {
                if lastIndex == chosenIndex { return }
                
                if cards[lastIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].ismatched = true
                    cards[lastIndex].ismatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                    if cards[lastIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                
                cards[chosenIndex].hasBeenSeen = true
                cards[lastIndex].hasBeenSeen = true
                
                lastFaceUpIndex = nil
                
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                lastFaceUpIndex = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    };    func index(of crad:Card)-> Int?{
        for i in 0..<cards.count{
            if cards[i].id == crad.id{
                return i
            }
        }
        return nil
    }
    mutating func shuffle(){
        cards.shuffle()
        print("shuffle cards:\(cards)")
    }
    struct Card: Equatable,Identifiable{
        static func == (lhs: memoryGame<CardContent>.Card, rhs: memoryGame<CardContent>.Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp && lhs.ismatched == rhs.ismatched && lhs.id == rhs.id
        }
        
        var hasBeenSeen = false
        var isFaceUp:Bool = false
        var ismatched:Bool = false
        var content: CardContent
        
        var id : String
    }
}
