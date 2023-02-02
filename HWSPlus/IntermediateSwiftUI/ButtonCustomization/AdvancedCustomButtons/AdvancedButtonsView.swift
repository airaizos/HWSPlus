//
//  AdvancedButtonsView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct AdvancedButtonsView: View {

    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Button {
                        print("Aqua")
                    } label: {
                        Text("Aqua")
                    }
                    .buttonStyle(AquaButtonStyle())
                    Button {
                        print("Aqua Style")
                    } label: {
                        Text("PPS")
                         
                    }
                    .buttonStyle(AquaButtonStylePPS())
                    
                    Button {
                        print("Aqua v2")
                    } label: {
                        Text("AquaV2")
                        
                    }
                    .buttonStyle(AquaButtonStyleV2())
                }
                HStack {
                    Button {
                        print("AEII")
                    } label: {
                        Text("Campaings")
                      
                    }
                    .buttonStyle(FantasyButtonStyle())
                    .frame(width: 300)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack {
                    ZStack {
                        Button {
                            print("Target button")
                        } label: {
                            Image(systemName: "star")
                        }
                        .buttonStyle(TargetButtonStyle(color: Color.red, strokeColor: .yellow, glowStrength: .medium))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .frame(height: 200)
                }
            }
            .navigationTitle("Advanced Customization")
        }
    }
}

struct AdvancedButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedButtonsView()
    }
}


extension View {
    /// Foreground text: Gradient fill and a light shadow behind it
    public func foregroundMask<Content: View>(_ overlay: Content) -> some View {
        self
            .overlay(overlay)
            .mask(self)
    }
}
