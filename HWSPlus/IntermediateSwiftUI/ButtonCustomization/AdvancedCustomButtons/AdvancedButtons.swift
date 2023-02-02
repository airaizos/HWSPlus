//
//  AdvancedButtons.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/2/23.
//

import SwiftUI


struct AquaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    Color(red: 0.3, green: 0.6, blue: 1)
                    
                    if configuration.isPressed {
                        Color.blue.opacity(0.2)
                    }
                    
                }
            )
            .clipShape(Capsule())
    }
}
