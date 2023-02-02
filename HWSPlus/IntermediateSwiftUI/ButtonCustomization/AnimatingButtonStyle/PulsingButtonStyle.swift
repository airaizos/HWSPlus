//
//  PulsingButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct PulsingButtonStyle: ButtonStyle {
    /// SwiftUI no soporte properties Wrappers en Styles. Serán ignorados.
    /// Puedes usar Animations O Styles, pero no los dos
    //  @State private var animation = 0.0
    let animation: Double
    
    func makeBody(configuration: Configuration) -> some View {
     
            configuration.label
                .padding()
                .background(Color.pps8)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(4)
            
                .overlay(
                    Circle()
                        .stroke(Color.pps7, lineWidth: 2)
                        .scaleEffect(CGFloat(1 + animation))
                        .opacity(1 - animation)
                )
    }
}


struct AnimatedButton<Content: View>: View {
    var animationSpeed: Double = 2.0
    let action: () -> Void
    let label: () -> Content
    
    
    @State private var animation = 0.0
    
    var body: some View {
        Button(action: action, label: label)
            .buttonStyle(PulsingButtonStyle(animation: animation))
            .onAppear {
                withAnimation(Animation.easeOut(duration: animationSpeed).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
    }
}


protocol AnimatingButtonStyleProtocol: ButtonStyle {
    init(animation: Double)
}

struct PulsingProtocolButtonStyle: AnimatingButtonStyleProtocol {
    /// 1. Conformamos el boton como AnimatingButtonStyle
    let animation: Double
    
    func makeBody(configuration: Configuration) -> some View {
        
     
        configuration.label
            .padding()
            .background(Color.pps4)
            .clipShape( Ellipse())
            .frame(width: 200)
            .foregroundColor(.white)
            .padding(4)
            .overlay(
                    Ellipse()
                    .stroke(Color.pps5, lineWidth: 2)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            )
        
        
    }
}


struct AnimatedProtocolButton<ButtonStyle: AnimatingButtonStyleProtocol, Content: View>: View {
    /// 2. Conformamos el boton como AnimatingButtonStyle. Así aceptará cualquier botón que se conforme con  AnimatingButtonStyleProtocol
    var animationSpeed: Double = 2.0
    let buttonStyle: ButtonStyle.Type
    let action: () -> Void
    let label: () -> Content

    
    @State private var animation = 0.0
    
    var body: some View {
        Button(action: action, label: label)
            .buttonStyle(buttonStyle.init(animation: animation))
            .onAppear {
                withAnimation(Animation.easeOut(duration: animationSpeed).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
    }
}

struct AnimatedProtocolButtonV2<ButtonStyle: AnimatingButtonStyleProtocol, Content: View>: View {
    /// 2. Conformamos el boton como AnimatingButtonStyle. Así aceptará cualquier botón que se conforme con  AnimatingButtonStyleProtocol
    var animationSpeed: Double = 2.0
    let buttonStyle: ButtonStyle.Type
    let animationType: Animation
    let action: () -> Void
    let label: () -> Content

    @State private var animation = 0.0
    
    var body: some View {
        Button(action: action, label: label)
            .buttonStyle(buttonStyle.init(animation: animation))
            .onAppear {
                withAnimation(animationType) {
                    animation = 1
                }
            }
    }
}

struct PulsingButtonStyleV2: ButtonStyle {
    let animation: Double
    
    
    func color(for configuration: Configuration) -> Color {
        configuration.isPressed ? .pps2 : .pps5
    }
    func makeBody(configuration: Configuration) -> some View {

            configuration.label
                .padding()
                .background(color(for: configuration))
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(4)
            
                .overlay(
                    Circle()
                        .stroke(Color.pps7, lineWidth: 2)
                        .scaleEffect(CGFloat(1 + animation))
                        .opacity(1 - animation)
                )
      
    }
}


struct PulsingProtocolButtonStyleV2: AnimatingButtonStyleProtocol {
    /// 1. Conformamos el boton como AnimatingButtonStyle
    let animation: Double
    
    func color(for configuration: Configuration) -> Color {
        configuration.isPressed ? .pps2 : .pps5
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
     
        configuration.label
            .padding()
            .background(color(for: configuration))
            .clipShape( Ellipse())
            .frame(width: 200)
            .foregroundColor(.white)
            .padding(4)
            .overlay(
                    Circle()
                        .stroke(color(for: configuration), lineWidth: 2)
                        .scaleEffect(CGFloat(0.3 + animation))
                    .opacity(1 - animation)
            )
            .overlay(
                    Circle()
                        .stroke(color(for: configuration), lineWidth: 2)
                        .scaleEffect(CGFloat(0.6 + animation))
                    .opacity(1 - animation)
            )
            .overlay(
                Circle()
                        .stroke(color(for: configuration), lineWidth: 2)
                        .scaleEffect(CGFloat(0.8 + animation))
                    .opacity(1 - animation)
            )
        
    }
}
