//
//  ContentView.swift
//  memorize
//
//  Created by 11344103 on 3/16/26.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["A","B","C","D","Z","T","P","H","O","M","Q","W","E","F","S","Y","🐮"]
    @State var emojiCount = 7
    var body: some View {
        VStack{
            cardlist
            Spacer()
            actionButtons
        }
        .padding()
        .foregroundStyle(.orange)
    }
    var cardlist: some View{
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 85),spacing: 0.01)],spacing: 0.01){
                ForEach(emojis[0..<emojiCount], id: \.self){ emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
    var actionButtons: some View{
        HStack{
            remove
            Spacer()
            add
        }
    }
    var remove: some View{
        Button{
            if emojiCount>1{
                emojiCount -= 1
            }
        }
        label:{
            Image(systemName: "minus.circle")
        }
    }
    var add:some View{
        Button{
            if emojiCount<emojis.count{
                emojiCount += 1
            }
            
            
        }
        label:{
            Image(systemName: "plus.circle")
        }
    }
    }
struct CardView :View {
    @State var isFaceup:Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape=RoundedRectangle(cornerRadius: 20.0)
            Group{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(Font.system(size: 300))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(isFaceup ? 1 : 0)
            shape.opacity(isFaceup ? 0 : 1)
        }
        .onTapGesture(perform: {
            isFaceup = !isFaceup
        })
    }
    
}

#Preview {
    ContentView()
}


