//
//  CheckToggleStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.label
            Button(action: { configuration.isOn.toggle() }) {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .accentColor  : .secondary)
                .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                .imageScale(.large)
                
                
            }
                
        }
    }
}

struct CheckToggleStyleCh1: ToggleStyle {
    var checked : String
    var unchecked: String
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.label
            Button(action: { configuration.isOn.toggle() }) {
                ZStack {
               
                Image(systemName: configuration.isOn ? checked : unchecked)
                .foregroundColor(configuration.isOn ? color  : .secondary)
                .accessibility(label: Text(configuration.isOn ? "Favorite" : "Not favorite"))
               
                .imageScale(.large)
                
                    if configuration.isOn {
                        Image(systemName: checked)
                            .foregroundColor(.white)
                            .imageScale(.medium)
                        Image(systemName: checked)
                            .foregroundColor(.classicRed)
                            .imageScale(.small)
                    }
                }
            }
                
        }
    }
}
