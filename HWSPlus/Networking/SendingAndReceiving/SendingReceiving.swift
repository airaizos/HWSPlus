//
//  SendingReceiving.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 1/3/23.
//

import SwiftUI

private enum ErroresItunes {
    case invalidURL, invalidData
}


struct Response: Codable {
    var results:[Resultado]
}

struct Resultado:Codable {
    var trackId:Int
    var trackName:String
    var collectionName:String
}


struct SendingReceivingView: View {
    @State private var results = [Resultado]()
    
    var body: some View {
        List(results, id:\.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
        print("Invalida data ")
        }
    }
}

struct SendingReceivingView_Previews: PreviewProvider {
    static var previews: some View {
        SendingReceivingView()
    }
}
