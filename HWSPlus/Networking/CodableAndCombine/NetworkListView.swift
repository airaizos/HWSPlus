//
//  NetworkListView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import SwiftUI

struct NetworkListView: View {
  
    @State private var selection: String? = ""
    var posts: [String]

    var body: some View {
        NavigationView {
            
            List(selection: $selection) {
                ForEach(posts, id:\.self) { post in
                    Text(post)
                        .font(.callout)
                }
            }
        }
    }
}

struct NetworkList_Previews: PreviewProvider {
    static var previews: some View {
        NetworkListView(posts: [""])
    }
}
