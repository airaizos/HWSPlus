//
//  NetworkCombiningView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Combine
import SwiftUI

struct NetworkCombiningView: View {
    @State private var requests = Set<AnyCancellable>()
    private var network = NetworkCombining()
    @State private var messages = [Message]()
    @State private var favorites = Set<Int>()
    
    var body: some View {
        NavigationView {
            VStack{
                List(messages) { message in
                    HStack {
                        VStack(alignment: .leading){
                            Text(message.from)
                                .font(.headline)
                            Text(message.message)
                                .foregroundColor(.secondary)
                        }
                        if favorites.contains(message.id) {
                            Spacer()
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            .navigationTitle("Messages")
        }
        .onAppear {
            network.combiningTask { result in
                switch result {
                case .success(let datos):
                    self.messages = datos.0
                    self.favorites = datos.1
                case .failure(_):
                    break
                }
            }
    
            /*
            let messageTask = network.fetch(messagesURL, defaultValue: [Message]())
            let favoritesTask = network.fetch(favoritesURL, defaultValue: Set<Int>())
            
            let combined = Publishers.Zip(messageTask,favoritesTask)
            
            combined.sink { loadedMessages, loadedFavorites in
                self.messages = loadedMessages
                self.favorites = loadedFavorites
            }
            .store(in: &requests)
             */
        }
            
    }
}

struct NetworkCombiningView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCombiningView()
    }
}
