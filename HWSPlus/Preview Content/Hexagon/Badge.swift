//
//  Badge.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct Badge: View {
    var symbolColor: Color  = .white
    var gradientStart: Color = .pps1
    var gradientEnd: Color = .pps8
    var angleDegrees: Double = 0
    
    var badgeSymbols: some View {
        
        ForEach(0..<8) { index in
            
            RotatedBadgeSymbol(color: symbolColor, angle: Angle(
                degrees: Double(index) / Double(8)) * 360.0
            )
                .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackground(gradientStart: gradientStart, gradientEnd: gradientEnd, angle: angleDegrees)
            
            GeometryReader { geo in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geo.size.width / 2, y: (3.0 / 4.0 ) * geo.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
