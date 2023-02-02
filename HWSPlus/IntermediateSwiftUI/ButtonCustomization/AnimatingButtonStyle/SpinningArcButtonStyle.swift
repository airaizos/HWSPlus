//
//  SpinningArcButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct SpinningArcButtonStyle: AnimatingButtonStyleProtocol {
    let animation: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.pps2)
            .clipShape(Circle())
            .foregroundColor(.white)
            .padding(4)
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.pps2, lineWidth: 4)
                    .rotationEffect(.init(degrees: -animation * 360))
            )
            .padding(6)
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.pps2, lineWidth: 4)
                    .rotationEffect(.init(degrees: animation * 360))
            )
    }
}
