//
//  ContentView.swift
//  memorize
//
//  Created by 11344103 on 3/16/26.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["A","B","C","D","Z","T","P","H","O","M","Q","W","E","F","S","Y","G"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self){emoji in CardView(content: emoji)
                }
            }
            HStack {
                remove
                Spacer()
                add
            }
        }
        .padding()
        .foregroundStyle(.orange)
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
            var shape=RoundedRectangle(cornerRadius: 20.0)
            if isFaceup {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 20.0)
            }
        }
        .onTapGesture(perform: {
            isFaceup = !isFaceup
        })
    }
    
}

#Preview {
    ContentView()
}


