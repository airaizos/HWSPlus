//
//  CustomButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .font(.title)
            .background(Color.blue.opacity(configuration.isPressed ? 0.5 : 1))
            .clipShape(Circle())
            .foregroundColor(.white)
    }
}
