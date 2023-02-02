//
//  TargetButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

enum Intensity {
    case low, medium, high
}

struct TargetButtonStyle: ButtonStyle {
    var color: Color = Color.blue
    var strokeColor: Color = Color.white
    var glowStrength: Intensity = .medium
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .foregroundColor(strokeColor)
            .padding(40)
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [ color, color.opacity(0)]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 50
                )
            )
            .opacity(configuration.isPressed ? 0.8 : 1)
        
        
        // Circles
            .overlay(circle(with: configuration))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 90)))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 180)))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 270)))
        
        // Ticks
        
            .overlay(tick(with: configuration))
            .overlay(tick(with: configuration).rotationEffect(.init(degrees: 90)))
            .overlay(tick(with: configuration).rotationEffect(.init(degrees: 180)))
            .overlay(tick(with: configuration).rotationEffect(.init(degrees: 270)))
    }
    
    
    func circle(with configuration: Configuration) -> some View {
        Circle()
            .trim(from: 0.05, to: 0.2)
            .stroke(strokeColor, lineWidth: 5)
        
            .shadow(color: color, radius: 5)
            .shadow(color: color, radius: 5)
            .shadow(color: color, radius: 5)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
    
    func tick(with configuration: Configuration) -> some View {
        
        strenght
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
        
    }
    
    
    @ViewBuilder var strenght: some View {
        switch glowStrength {
        case .low:
            Circle()
                .trim(from: 0.24, to: 0.26)
                .stroke(strokeColor, lineWidth: 20)
                .shadow(color: color, radius: 5)
            
        case .medium:
            Circle()
                .trim(from: 0.24, to: 0.26)
                .stroke(strokeColor, lineWidth: 20)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
            
        case .high:
            Circle()
                .trim(from: 0.24, to: 0.26)
                .stroke(strokeColor, lineWidth: 20)
            
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
                .shadow(color: color, radius: 5)
        }
    }
    
}





