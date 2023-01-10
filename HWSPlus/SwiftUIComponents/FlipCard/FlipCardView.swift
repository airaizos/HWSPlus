//
//  FlipCardView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct FlipCardView: View {
    
    @State private var cardFlipped = false
    var body: some View {
        FlipView(isFlipped: cardFlipped) {
            Text("Front Side")
                .font(.largeTitle)
                .padding()
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        } back: {
            Text("Back Side")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .animation(.spring(response: 0.35, dampingFraction: 0.7),value: cardFlipped)
        .onTapGesture {
            cardFlipped.toggle()
        }
        
    }
}

struct FlipCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCardView()
    }
}
