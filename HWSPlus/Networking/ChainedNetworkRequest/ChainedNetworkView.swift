//
//  ChainedNetworkView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import SwiftUI

struct ChainedNetworkView: View {
    private var chainedNetwork = ChainedNetwork()
    
    @State private var items = [NewsItem]()
    
    var body: some View {
        NavigationView {
            VStack{
                Button("Fetch News") {
                    
                }
                List(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.strap)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Hacking with Swift News")
        }
    }
}

struct ChainedNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        ChainedNetworkView()
    }
}
