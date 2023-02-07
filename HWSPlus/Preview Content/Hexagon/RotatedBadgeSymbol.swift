//
//  RotatedBadgeSymbol.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    var color: Color = .accentColor
    let angle: Angle

    var body: some View {
        BadgeSymbol(color: color)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
