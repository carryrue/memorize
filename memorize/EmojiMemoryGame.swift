//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344103 on 3/30/26.
//

import Foundation
import SwiftUI

@Observable
class EmojiMemoryGame {
    
    private var model: memoryGame<String>
    
    private(set) var themePool: ThemePool
    private(set) var theme: Theme
    
    // MARK: init
    init() {
        themePool = EmojiMemoryGame.createThemePool()
        
        let selectedTheme = themePool.themes.randomElement() ?? themePool.themes[0]
        
        theme = selectedTheme
        model = EmojiMemoryGame.createMemoryGame(with: selectedTheme)
    }
    
    // MARK: 建立 ThemePool
    private static func createThemePool() -> ThemePool {
        var pool = ThemePool()
        
        pool.addTheme(Theme(
            name: "Animals",
            color: .orange,
            numberOfPairs: 6,
            items: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
        ))
        
        pool.addTheme(Theme(
            name: "Food",
            color: .red,
            numberOfPairs: 6,
            items: ["🍎","🍔","🍟","🍕","🍩","🍉","🍇"]
        ))
        
        pool.addTheme(Theme(
            name: "Sports",
            color: .blue,
            numberOfPairs: 6,
            items: ["⚽️","🏀","🏈","⚾️","🎾","🏐"]
        ))
        
        return pool
    }
    
    // MARK: 建立遊戲
    private static func createMemoryGame(with theme: Theme) -> memoryGame<String> {
        
        let shuffled = theme.items.shuffled()
        
        return memoryGame<String>(
            numberOfParisOfCards: theme.numberOfPairs,
            createCardContent: { index in
                shuffled[index]
            }
        )
    }
    
    // MARK: Intent
    
    var cards: [memoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func choose(_ card: memoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    // ⭐ 新遊戲
    func newGame() {
        theme = themePool.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
struct Theme {
    var name: String
    var color: Color
    var numberOfPairs: Int
    var items: [String]
}
struct ThemePool {
    private(set) var themes: [Theme] = []
    
    mutating func addTheme(_ theme: Theme) {
        themes.append(theme)
    }
}
