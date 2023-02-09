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
    @State private var isMonitorActive = true
    
    
    var body: some View {
        
        VStack {
            Button("Fetch Data") {
                isPressed = true
                isMonitorActive = true
                network.makeRequest { data,finished in
                    collectedData = data
                    isPressed = finished
                }
            }
            HStack {
                Text(verbatim: """
                Active: \(isMonitorActive ? "\(network.isActive)" : "")
                Expensive: \(isMonitorActive ? "\(network.isExpensive)" : "")
                Constrained: \(isMonitorActive ? "\(network.isConstrained)" : "")
                """
                )
                Spacer()
                
                Image(systemName: network.connectionType == .wifi ? "wifi" : "wifi.slash")
                    .font(.title3)
                    .hidden(!isMonitorActive)
                Image(systemName: network.connectionType == .cellular ?  "antenna.radiowaves.left.and.right" : "antenna.radiowaves.left.and.right.slash")
                    .hidden(!isMonitorActive)
                Image(systemName: network.connectionType == .loopback ? "antenna.radiowaves.left.and.right.circle" : "")
                
                Image(systemName:  network.connectionType == .wiredEthernet ? "cable.connector" : "")
                    .hidden(!isMonitorActive)
                
            }
            if (isPressed && isMonitorActive) {
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundColor(.offWhite)
            } else {
                Text(collectedData)
                    .font(.title)
                    .bold()
            }
            
            Button("Stop Monitor") {
                network.stopMonitor {
                    isMonitorActive = $0
                }
            }.hidden(!isMonitorActive)
        }
    }
}

struct NetworkMonitorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkMonitorView()
    }
}


extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
