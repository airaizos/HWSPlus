//
//  RemoteImageView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.

import SwiftUI

struct RemoteImageView: View {
    var body: some View {
        VStack {
            RemoteImage(url:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/04/memoji.png" )
                .scaledToFit()
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
