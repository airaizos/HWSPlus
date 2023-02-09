//
//  NetworkMonitorView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import SwiftUI

struct NetworkMonitorView: View {
    @EnvironmentObject var network: NetworkMonitor
    
    @State private var collectedData = ""
    @State private var isPressed = false
    
    var body: some View {
        
        VStack {
            Button("Fetch Data") {
                isPressed = true
                network.makeRequest { data,finished in
                    collectedData = data
                    isPressed = finished
                }
            }
            Text(verbatim: """
                Active: \(network.isActive)
                Expensive: \(network.isExpensive)
                Constrained: \(network.isConstrained)
                """
                 )
            if isPressed {
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundColor(.offWhite)
            } else {
                Text(collectedData)
                    .font(.title)
                    .bold()
            }
        }
    }
}

struct NetworkMonitorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkMonitorView()
    }
}
