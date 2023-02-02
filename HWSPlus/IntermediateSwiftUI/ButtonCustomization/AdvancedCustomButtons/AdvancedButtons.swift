//
//  AdvancedButtons.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/2/23.
//

import SwiftUI

struct AquaButtonStyle: ButtonStyle {
    let blueHighlight = Color(red: 0.7, green: 1, blue: 1)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    Color(red: 0.3, green: 0.6, blue: 1)
                    
                    Capsule()
                        .inset(by: 4)
                        .fill (
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(x: 0.95, y: 0.7, anchor: .top)
                    
                    Capsule()
                        .inset(by: 8)
                        .offset(y: 8)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [blueHighlight.opacity(0), blueHighlight]),
                                startPoint: .top,
                                endPoint: .init(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(y: 0.7, anchor: .bottom)
                        .blur(radius: 10)
                    
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.black.opacity(0.25), lineWidth: 1)
                            )
                    
                    if configuration.isPressed {
                        Color.blue.opacity(0.2)
                    }
                    
                }
            )
            .clipShape(Capsule())
    }
}

struct AquaButtonStylePPS: ButtonStyle {
    let blueHighlight = Color(red: 0.7, green: 1, blue: 1)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    Color.pps4
                    
                    Capsule()
                        .inset(by: 4)
                        .fill (
                            LinearGradient(
                                gradient: Gradient(colors: [Color.pps1, Color.pps1.opacity(0)]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(x: 0.95, y: 0.7, anchor: .top)
                    
                      
                    
                    
                    if configuration.isPressed {
                        Color.blue.opacity(0.2)
                    }
                    
                }
            )
            .clipShape(Capsule())
    }
}


struct AquaButtonStyleV2: ButtonStyle {
    let blueHighlight = Color(red: 0.7, green: 1, blue: 1)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    Color.pps4
                    
                    Capsule()
                        .inset(by: 4)
                        .fill (
                            LinearGradient(
                                gradient: Gradient(colors: [Color.pps1, Color.pps1.opacity(0)]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(x: 0.95, y: 0.7, anchor: .top)
                    
                    Capsule()
                        .inset(by: 8)
                        .offset(y: 8)
                        .fill (
                            LinearGradient(gradient: Gradient(colors: [Color.pps4.opacity(0), Color.pps4]), startPoint: .top, endPoint: .init(x: 0.5, y: 0.8)
                             )
                        )
                        .scaleEffect(y: 0.7, anchor: .bottom)
                        .blur(radius: 10)
                    
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.pps8.opacity(0.25), lineWidth: 1)
                            )
                    
                    if configuration.isPressed {
                        Color.blue.opacity(0.2)
                    }
                    
                }
            )
            .clipShape(Capsule())
    }
}
