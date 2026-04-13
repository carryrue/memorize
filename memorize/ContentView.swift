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
        VStack{
            cardlist
                .animation(.default,value: viewmodel.cards)
            Spacer()
            Button("Shuffle"){
                viewmodel.shuffle()
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundStyle(.orange)
    }
    var cardlist: some View{
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0){
                ForEach(viewmodel.cards){ card in CardView(card: card)
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
    var body: some View {
        ZStack {
            let shape=RoundedRectangle(cornerRadius: 20.0)
            Group{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(Font.system(size: 300))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            shape.opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.ismatched && !card.isFaceUp ? 0 : 1)
    }
    
}

#Preview {
    ContentView(viewmodel:EmojiMemoryGame())
}


