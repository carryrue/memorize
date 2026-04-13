//
//  memoryGame.swift
//  memorize
//
//  Created by 11344103 on 3/30/26.
//

import Foundation

struct memoryGame<CardContent> where CardContent: Equatable{
    var cards:[Card]
    
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
    mutating func choose(_ card:Card){
        if let chosenIndex = index(of: card){
            if let lastIndex = lastFaceUpIndex{
                if cards[lastIndex].content == cards[chosenIndex].content{
                    cards[chosenIndex].ismatched.toggle()
                    cards[lastIndex].ismatched.toggle()
                }
                lastFaceUpIndex = nil
            }else{
                for i in 0..<cards.count{
                    cards[i].isFaceUp = false
                }
                lastFaceUpIndex=chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("cards:\(cards)")
    }
    func index(of crad:Card)-> Int?{
        for i in 0..<cards.count{
            if cards[i].id == crad.id{
                return i
            }
        }
        return 0
    }
    mutating func shuffle(){
        cards.shuffle()
        print("shuffle cards:\(cards)")
    }
    struct Card: Equatable,Identifiable{
        static func == (lhs: memoryGame<CardContent>.Card, rhs: memoryGame<CardContent>.Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp && lhs.ismatched == rhs.ismatched && lhs.id == rhs.id
        }
        
        var isFaceUp:Bool = false
        var ismatched:Bool = false
        var content: CardContent
        
        var id : String
    }
}
