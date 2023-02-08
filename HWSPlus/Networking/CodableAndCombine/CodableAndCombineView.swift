//
//  CodableAndCombineView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import SwiftUI

struct CodableAndCombineView: View {
    var networkSession = NetworkSession()
    var localSession = LocalSession()
    
    @State private var posts: [String] = []
    
    var body: some View {
        VStack {
            Button("Fetch data") {
                
                let url = URL(string: "https://proximaparadaswift.dev/wp-json/wp/v2/posts/388")!
                
                // Network Session
                
                networkSession.fetchDataTask(url)
                
                networkSession.fetchPublisher(url)
                
                networkSession.fetchPublisherGeneric(url, defaultValue: Post.default) {
                    posts.append("Combine, Generic: \($0.title.rendered)")
                    print("** COMBINE & GENERIC:\n\($0.title.rendered)") }
                
                networkSession.fetchPublisherGeneric(url, defaultValue: Post.default, decodingStrategy: .useDefaultKeys, dispatchQueue: .main) {
                    posts.append("Combine, Generic, and Options: \($0.title.rendered)")
                //    self.posts.append(post)
                    print("** COMBINE, GENERIC & OPTIONS:\n\($0.title.rendered)")
                }
                
                // Local Session
                localSession.fetchFile("post388")
                
                localSession.fetchFile("mac", decodingStrategy: .convertFromSnakeCase)

            }
            
            if !posts.isEmpty {
                NetworkListView(posts: posts)
            }
        }
    }
}

struct CodableAndCombineView_Previews: PreviewProvider {
    static var previews: some View {
        CodableAndCombineView()
    }
}
