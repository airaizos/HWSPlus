//
//  StretchingMarginView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 11/1/23.
//

import SwiftUI

struct StretchingMarginView: View {
    var body: some View {
        ScrollView(.horizontal) {
            StretchingMargin {
                Image("marginImage")
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 60)
        }
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct StretchingMarginView_Previews: PreviewProvider {
    static var previews: some View {
        StretchingMarginView()
    }
}
