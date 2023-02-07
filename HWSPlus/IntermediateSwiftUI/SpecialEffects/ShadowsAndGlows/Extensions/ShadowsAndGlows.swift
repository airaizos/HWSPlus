//
//  ShadowsAndGlows.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .overlay(self.blur(radius: radius / 6 ))
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
    
    
    func multicolorGlow(size: CGFloat = 90) -> some View {
        let multicolors: [Int:Color] = [1:.classicRed,2:.orange,3:.green, 4:.blue, 5:.purple, 6:.red]
        
        func order(_ num: Int = 0) -> [Color] {
            
            let exp = (num < 0 || num > 6) ? num : 0
                      
            var colors: [Int:Color] = [:]
            
            for color in multicolors {
                colors.updateValue(color.value, forKey: abs(color.key - exp))
            }
            let newOrder = colors.sorted(by: { $0.key < $1.key })
            return newOrder.map { $0.value }
            }
        ///  los colores de grandient deben ser un ArrayLiteral, no he podido crearlos a través de un método
       return ZStack {
            ForEach(0..<2) { i in
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow,.orange, .green, .blue, .purple, .red ]), center: .center))
                    .frame(width: size * 1.5, height: size * 1.5)
                    .mask(self.blur(radius: size * 0.1))
                    .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
            }
        }
        .offset(y: -(size * 0.25))
    }
    
}

extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 7 ) -> some View {
        
        let finalX = CGFloat(cos(angle.radians - .pi / 2))
        let finalY = CGFloat(sin(angle.radians - .pi / 2 ))
        
        return self
            .overlay(
                shape.stroke(style: .init(lineWidth: width, lineCap: .round, lineJoin: .round))
                    .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
                    .blur(radius: blur)
                    .mask(shape)
            )
        
    }
}
