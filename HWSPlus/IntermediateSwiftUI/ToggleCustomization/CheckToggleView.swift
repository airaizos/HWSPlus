//
//  CheckToggleView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct CheckToggleView: View {
    @State private var showAdvanced = false
    @State private var isOn = false
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show Advanced Options", isOn: $showAdvanced)
                    .toggleStyle(CheckToggleStyle())
                    .font(.largeTitle)
                Toggle("", isOn: $isOn)
                    .toggleStyle(CheckToggleStyleCh1(checked: "heart.fill", unchecked: "heart", color: .yellow))
                    .font(.largeTitle)
            }
            .navigationTitle("Toggle Customized")
        }
    }
}

struct CheckToggleView_Previews: PreviewProvider {
    static var previews: some View {
        CheckToggleView()
    }
}
