//
//  ButtonCustomizationButonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 31/1/23.
//

import SwiftUI

struct ButtonCustomizationButtonStyle: View {
    var body: some View {
        NavigationView {
            VStack {
                Button {
                   print("Pressed!")
                } label: {
                    Text("Empty Style")
                }
                .buttonStyle(EmptyStyle())
                
                Button {
                    print("apple's button")
                } label: {
                    Text("Colored button style")
                }
                .buttonStyle(ColoredButtonStyle(color: .blue))
                
                Button {
                    print("Striped Button Style")
                } label: {
                    Text("Striped Rectangle")
                }
                .buttonStyle(StripedRectangleButtonStyle())
                
                Button {
                    print("PushButton")
                } label: {
                    Image(systemName: "bird.fill")
                    
                }
                .buttonStyle(PushButtonStyle())
                
                Button {
                    print("Classic Button")
                } label: {
                    HStack {
                        Image(systemName: "phone.down.fill")
                        Text("EndCall")
                    }
                    
                }
                .buttonStyle(GlassButtonStyle(color: .classicRed))
                .padding(.horizontal)
            }
            .navigationTitle("ButtonStyle")
        }
       
    }
}

struct ButtonCustomizationButonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustomizationButtonStyle()
    }
}
