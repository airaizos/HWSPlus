//
//  Page29.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 27/2/23.
//

import SwiftUI

struct Page29View: View {
    @State private var sourceCode = ""
    
    
    var body: some View {
        ScrollView {
            Text(sourceCode)
        }
        .task {
            await fetchSource()
        }
    }
    func fetchSource() async {
        do {
            let url = URL(string: "https://www.proximaparadaswift.dev")!
            
            let (data,_) = try await URLSession.shared.data(from: url)
            sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            sourceCode = "Failed to fetch Próxima Parada Swift"
        }
    }
    
}

struct Page29View_Previews: PreviewProvider {
    static var previews: some View {
        Page29View()
    }
}
