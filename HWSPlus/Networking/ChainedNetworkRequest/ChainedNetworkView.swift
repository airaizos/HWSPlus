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
    @State private var color = Color.brown
    @State private var wColor = Color.purple
    @State private var itemsCount = 0
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{  Button("Another fetch") {
                    withAnimation(.easeOut) {
                        wColor = wColor == .purple ? .pink : .purple
                    }
                    
                }
                .padding(10)
                .foregroundColor(.white)
                .background(wColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                    Button("Fetch News") {
                        color = color == .brown ? .mint : .brown
                        chainedNetwork.fetchChained { result in
                            switch result {
                            case .success(let items):
                                self.items = items
                            case .failure(_):
                                break
                            }
                        }
                        itemsCount = items.count
                    }
                    
                    .padding(10)
                    .background(color)
                    .foregroundColor(.white)
                    .animation(.easeOut, value: color)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Text("\(items.count)")
                    .font(.title3)
                    .bold()
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
