//
//  LayeringShadowsView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct LayeringShadowsView: View {
    
    var size: CGFloat = 100
    var body: some View {
            VStack(spacing: 0){
                HStack(spacing: 50) {
                    Polygon(sides: 6)
                        .fill(Color.green)
                        .frame(width: size, height: size)
                        .shadow(color: .black, radius: 10)
                    
                    Polygon(sides:
                                6)
                    .fill(Color.green)
                    .frame(width: size, height: size)
                    .shadow(color: .green, radius: 5)
                    .shadow(color: .black, radius: 5)
                    .shadow(color: .black, radius: 5)
                    Polygon(sides:
                                6)
                    .fill(Color.classicGreen)
                    .frame(width: size, height: size)
                    .shadow(color: .green, radius: 10)
                    .shadow(color: .green, radius: 10)
                }
                HStack(spacing: 50) {
                    Polygon(sides: 6)
                        .fill(Color.classicRed)
                        .frame(width: size, height: size)
                        .shadow(color: .classicRed, radius: 36)
                    Polygon(sides: 6)
                        .fill(Color.classicRed)
                        .frame(width: size, height: size)
                        .glow(color: .red, radius: 36)
                }
                HStack {
                    Polygon(sides: 6)
                        .foregroundColor(.white)
                        .frame(width: size, height: size)
                        .multicolorGlow(size: size)
                }
                HStack {
                    ZStack {
                        Polygon(sides: 6)
                            .fill(Color.purple)
                            .frame(width: size, height: size)
                            .innerShadow(using: Polygon(sides: 6))
                    }
                }
                HStack(spacing: 50) {
                    Polygon(sides: 6)
                        .fill(Color.yellow)
                        .frame(width: size, height: size)
                        .innerGlow(using: Polygon(sides: 6))
                    Polygon(sides: 6)
                        .fill(Color.yellow)
                        .frame(width: size, height: size)
                        .innerGlow(using: Polygon(sides: 6),color: .yellow)
                        
                }
                HStack(spacing: 25) {
                    Polygon(sides: 6)
                        .fill(Color.orange)
                        .frame(width: size, height: size)
                        .multicolorGlow()
                        .offset(y: 20)
                    Polygon(sides: 6)
                        .fill(Color.yellow)
                        .frame(width: size, height: size)
                        .innerGlowIn(using: Polygon(sides: 6),color: .yellow)
                    ZStack{
                        Polygon(sides: 6)
                            .fill(Color.offWhite)
                            .frame(width: size, height: size)
                          .innerGlowIn(using: Polygon(sides: 6), radius: 50)
                        Polygon(sides: 6)
                            .fill(Color.offWhite)
                            .frame(width: size, height: size)
                          .innerGlow(using: Polygon(sides: 6))
                    }
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.offWhite)
            .ignoresSafeArea(.all)
    }
}

struct LayeringShadowsView_Previews: PreviewProvider {
    static var previews: some View {
        LayeringShadowsView()
    }
}

