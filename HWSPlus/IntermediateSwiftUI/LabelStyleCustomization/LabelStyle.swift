//
//  LabelStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 3/2/23.
//

import SwiftUI


struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .padding(10)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(Circle())
            
            configuration.title
                .font(.headline)
        }
    }
}


/// Hovering

protocol HoveringLabelStyle: LabelStyle {
    init(hovering: Bool)
}

struct HoveringLabel<LabelStyle: HoveringLabelStyle, Title: View, Icon: View>: View {
    let labelStyle: LabelStyle.Type
    let title: () -> Title
    let icon: () -> Icon
    
    @State private var isHovered = false
    
    var body: some View {
        Label(title: title, icon: icon)
            .labelStyle(labelStyle.init(hovering: isHovered))
            .onHover { over in
                withAnimation(.easeOut(duration: 0.5)) {
                    isHovered = over
                    print(over)
                }
            }
    }
}

struct VerticalRevealingLabelStyle: HoveringLabelStyle {
    let hovering: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .opacity(hovering ? 1 : 0)
        }
        .contentShape(Capsule())
    }
}


struct HighlightingLabelStyle: HoveringLabelStyle {
    let hovering: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
        .padding()
        .background(Capsule().fill(Color.accentColor.opacity(hovering ? 0.2 : 0)))
        .contentShape(Capsule())
    }
}
