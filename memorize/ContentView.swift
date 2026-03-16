//
//  ContentView.swift
//  memorize
//
//  Created by 11344103 on 3/16/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceup:false)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}
struct CardView :View {
    var isFaceup:Bool = true
    var body: some View {
        ZStack {
            if isFaceup {
                RoundedRectangle(cornerRadius: 20.0)
                    .strokeBorder(lineWidth: 3)
            }
            else{
                RoundedRectangle(cornerRadius: 20.0)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
