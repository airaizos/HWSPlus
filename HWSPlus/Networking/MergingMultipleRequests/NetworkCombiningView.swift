//
//  NetworkCombiningView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import SwiftUI

struct NetworkCombiningView: View {
    @State private var messages = [Message]()
    @State private var favorites = Set<Int>()
    
    var body: some View {
        NavigationView {
            List(messages) { message in
                HStack {
                    VStack(alignment: .leading){
                        Text(message.from)
                            .font(.headline)
                    
                        
                    }
                }
            }
        }
    }
}

struct NetworkCombiningView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCombiningView()
    }
}
