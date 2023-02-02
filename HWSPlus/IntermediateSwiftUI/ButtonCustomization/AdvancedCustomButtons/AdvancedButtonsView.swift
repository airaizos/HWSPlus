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
