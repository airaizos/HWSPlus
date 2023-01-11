//
//  StretchingHeaderView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct StretchingHeaderView: View {
    var body: some View {
        List {
            Section(header:
                        StretchingHeader {
                VStack {
                    Image("headerImage")
                        .resizable()
                        .scaledToFill()
                    
                    Text("StretchingHeader Code")
                }
            }
                .frame(height: 200)
                    
            ) {
                    ForEach(0..<20 ) { i in
                        Text("\(i)")
                    }
                }
            }
        .edgesIgnoringSafeArea(.all)
    }
}

struct StretchingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StretchingHeaderView()
    }
}
