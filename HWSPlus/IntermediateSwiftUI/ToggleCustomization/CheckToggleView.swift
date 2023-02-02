//
//  CheckToggleView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct CheckToggleView: View {
    @State private var showAdvanced = false
    
    var body: some View {
        Toggle("Show Advanced Options", isOn: $showAdvanced)
            .toggleStyle(CheckToggleStyle())
    }
}

struct CheckToggleView_Previews: PreviewProvider {
    static var previews: some View {
        CheckToggleView()
    }
}
