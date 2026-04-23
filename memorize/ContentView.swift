//
//  ContentView.swift
//  memorize
//
//  Created by 11344103 on 3/16/26.
//

import SwiftUI

struct ContentView: View {
    var viewmodel:EmojiMemoryGame
    var body: some View {
        VStack {
            Text(viewmodel.theme.name)
                .font(.largeTitle)
            
            Text("Score: \(viewmodel.score)")
                .font(.title)
                .foregroundColor(.red)
            
            cardlist
            
            Spacer()
            
            HStack {
                
                Button("Shuffle") {
                    viewmodel.shuffle()
                }
                .font(.title)
                
                Spacer()
                
                Button {
                    viewmodel.newGame()
                } label: {
                    VStack {
                        Image(systemName: "arrow.clockwise")
                            .font(.largeTitle)
                        Text("New Game")
                            .font(.caption)
                    }
                }
            }
        }
        .padding()
    }
    var cardlist: some View{
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0){
                ForEach(viewmodel.cards){ card in CardView(card: card, color: viewmodel.theme.color)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {viewmodel.choose(card)
                        }
                }
            }
        }
    }
}
struct CardView :View {
    var card:memoryGame<String>.Card
    var color: Color
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
            } else {
                shape.fill(color)
            }
        }
        .opacity(card.ismatched ? 0 : 1)
    }
}

#Preview {
    ContentView(viewmodel: EmojiMemoryGame())
}


