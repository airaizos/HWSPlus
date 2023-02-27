//
//  asyncPropertyView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 27/2/23.
//

import SwiftUI

struct AsyncPropertyView: View {
    let source = RemoteFile(url: URL(string: "https://hws.dev/inbox.json")!, type: [MessageP].self)
    
    @State private var messages = [MessageP]()
    var body: some View {
        NavigationView {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.user)
                        .font(.headline)
                    
                }
            }
            .navigationTitle("Inbox")
            .toolbar {
                Button(action: refresh) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
            }
            .onAppear(perform: refresh)
        }
    }
    func refresh() {
        Task {
            do {
                //Accediendo de manera asincrona
                
                messages = try await source.contents
            } catch {
                print("Message update failed.")
            }
        }
    }
}

struct AsyncPropertyView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPropertyView()
    }
}
