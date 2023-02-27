//
//  Page30View.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 27/2/23.
//

import SwiftUI

struct Page30View: View {
    @State private var site = "https://www."
    @State private var sourceCode = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Website address", text: $site)
                    .textFieldStyle(.roundedBorder)
                Button("Go") {
                    Task { await fetchSource()
                        
                    }
                }
            }
            .padding()
            ScrollView {
                Text(sourceCode)
            }
        }
    }
    func fetchSource() async {
        do {
            let url = URL(string: site)!
            let (data,_) = try await URLSession.shared.data(from: url)
            sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            sourceCode = "Failed to fecth \(site)"
        }
    }
}

struct Page30View_Previews: PreviewProvider {
    static var previews: some View {
        Page30View()
    }
}
