//
//  NetworkMonitorView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import SwiftUI

struct NetworkMonitorView: View {
    @EnvironmentObject var network: NetworkMonitor
    
    var body: some View {
        Text(verbatim: """
            Active: \(network.isActive)
            Expensive: \(network.isExpensive)
            Constrained: \(network.isConstrained)
            """
             )
    }
}

struct NetworkMonitorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkMonitorView()
    }
}
