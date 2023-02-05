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


protocol ShowingLabelStyleProtocol: LabelStyle {
    init(showing: Bool)
}

struct ShowingLabel<LabelStyle: ShowingLabelStyleProtocol, Title: View, Icon: View>: View {
    let labelStyle: LabelStyle.Type
    let title: () -> Title
    let icon: () -> Icon
    
    @State private var isShowing = false
    
    var body: some View {
        Label(title: title, icon: icon)
            .labelStyle(labelStyle.init(showing: isShowing))
            .onHover { over in
                withAnimation(.easeOut(duration: 0.5)) {
                    isShowing = over
                }
            }
    }
}

struct ShowingLabelStyle: ShowingLabelStyleProtocol {
    var showing: Bool

    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(showing ? Color.pps2 : Color.pps6 )
            configuration.title
                .foregroundColor(Color.pps8.opacity(showing ? 1 : 0))
        }
        .foregroundColor(.accentColor)
        .font(.largeTitle)
    }
}

struct ShowingInvertedLabelStyle: ShowingLabelStyleProtocol {
    var showing: Bool

    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
                .foregroundColor(Color.pps8.opacity(showing ? 1 : 0))
            configuration.icon
                .foregroundColor(showing ? Color.pps2 : Color.pps6 )
                .scaleEffect(showing ? 1 : 2)
        }
        .foregroundColor(.accentColor)
        .font(.largeTitle)
    }
}

struct ShowingVerticalLabelStyle: ShowingLabelStyleProtocol {
    var showing: Bool

    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
                .foregroundColor(Color.pps7.opacity(showing ? 1 : 0))
            configuration.icon
                .foregroundColor(showing ? Color.pps5 : Color.pps7 )
        }
        .foregroundColor(.accentColor)
        .font(.largeTitle)
    }
}

struct ShowingVerticalInvertedLabelStyle: ShowingLabelStyleProtocol {
    var showing: Bool

    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .foregroundColor(showing ? Color.pps5 : Color.pps7 )
            configuration.title
                .foregroundColor(Color.pps7.opacity(showing ? 1 : 0))
        }
        .foregroundColor(.accentColor)
        .font(.largeTitle)
    }
}
