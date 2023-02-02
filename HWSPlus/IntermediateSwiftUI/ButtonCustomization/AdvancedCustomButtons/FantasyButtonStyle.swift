//
//  FantasyButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct FantasyButtonStyle: ButtonStyle {
    
    //MARK: var
    
    var foregroundGradientStart = Color(red: 1, green: 0.85, blue: 0.85)
    var foregroundGradientEnd = Color(red: 1, green: 0.65, blue: 0.3)
    
    var backgroundGradientStart = Color(red: 0.33, green: 0.06, blue: 0.04)
    var backgroundGradientEnd = Color(red: 0.5, green: 0.1, blue: 0.1)
    var rimGradientStart = Color(red: 0.725, green: 0.55, blue: 0.3)
    var rimGradientEnd = Color(red: 0.2, green: 0.13, blue: 0.05)
    
    // MARK: private var
    private var foregroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [foregroundGradientStart, foregroundGradientEnd]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var backgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: backgroundGradientStart, location: 0),
                .init(color: backgroundGradientEnd, location: 0.3),
                .init(color: backgroundGradientEnd, location: 0.7),
                .init(color: backgroundGradientStart, location: 1)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    private var rimGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: rimGradientStart, location: 0),
                .init(color: rimGradientStart, location: 0.49),
                .init(color: rimGradientEnd, location: 0.51),
                .init(color: rimGradientEnd, location: 1)
            ]),
            startPoint: UnitPoint(x: 0.47, y: 0),
            endPoint: UnitPoint(x: 0.53, y: 1)
            
        )
        
    }
    
    //MARK: makeBody
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundMask(foregroundGradient)
            .font(Font.system(.largeTitle, design: .serif).lowercaseSmallCaps())
            .shadow(color: .black, radius: 5, x: 3, y:3)
        
            .padding()
            .background(
                ZStack {
                    backgroundGradient
                    if configuration.isPressed {
                        Color.black.opacity(0.3)
                    }
                }
            )
        
            .overlay(
                Rectangle()
                    .stroke(Color.black, lineWidth: 8)
                    .blur(radius: 8)
                    .mask(Rectangle())
            )
        
            .overlay(
                Rectangle()
                    .strokeBorder( rimGradientStart, lineWidth: 1)
                    .padding(2)
                    .overlay(
                        Rectangle()
                            .strokeBorder(rimGradient, lineWidth: 2)
                        )
                )
        
    }
}
