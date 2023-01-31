//
//  CustomButton.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 31/1/23.
//

import SwiftUI

struct EmptyStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct ColoredButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 50)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
            .overlay(
                Color.black
                    .opacity(configuration.isPressed ? 0.3 : 0)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            )
    }
}


struct StripedRectangleButtonStyle: ButtonStyle {
    var offColor = Color.pps3
    var onColor = Color.pps7
    
    func color(for configuration: Configuration) -> Color {
        configuration.isPressed ? onColor : offColor
    }
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .fill(color(for: configuration))
                .frame(width: 10)
            
            configuration.label
                .padding()
                .foregroundColor(color(for: configuration))
                .textCase(.uppercase)
                .font(Font.title.bold())
                .border(color(for: configuration), width: 4)
        }
        .fixedSize()
        .animation(.easeIn(duration: 3), value: 3)
    }
}

struct PushButtonStyle: ButtonStyle {
    let lightGray = Color.pps4.opacity(0.8)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let startEdge: UnitPoint
        let endEdge: UnitPoint
        
        if configuration.isPressed {
            startEdge = UnitPoint.bottomTrailing
            endEdge = UnitPoint.topLeading
        } else {
            startEdge = UnitPoint.topLeading
            endEdge = UnitPoint.bottomTrailing
        }
        
        return configuration.label
            .foregroundColor(Color.pps7.opacity(configuration.isPressed ? 0.7 : 1))
            .font(.largeTitle)
            .padding(30)
            .background(
                LinearGradient(gradient: Gradient(colors: [lightGray, .pps1]), startPoint: startEdge, endPoint: endEdge)
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [lightGray, .pps1]), startPoint: startEdge, endPoint: endEdge),
                        lineWidth: 16
                    )
                    .padding(2)
                    .overlay(
                        Circle()
                            .stroke(configuration.isPressed ? Color.pps6 : Color.pps6, lineWidth: 4)
                    )
            )
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .shadow(color: Color.pps6.opacity(configuration.isPressed ? 0 : 0.4), radius: 10, x: 10, y: 10)
       //     .animation(.linear, value: 0)
    
    }
}


struct GlassButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.largeTitle.bold())
                .foregroundColor(color)
                .offset(x: -1, y: -1)
            
            configuration.label
                .font(Font.largeTitle.bold())
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            color
                .overlay(
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: Color.white.opacity(0.6), location: 0),
                        Gradient.Stop(color: Color.white.opacity(0.15), location: 0.499),
                        Gradient.Stop(color: Color.white.opacity(0), location: 0.5),
                        Gradient.Stop(color: Color.white.opacity(0), location: 0.8),
                        Gradient.Stop(color: Color.white.opacity(0.2), location: 1)
                    ]), startPoint: .top, endPoint: .bottom)
        )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color.white.opacity(0.4), lineWidth: 1)
                    )
            )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
