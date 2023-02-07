//
//  LayeringShadowsView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct LayeringShadowsView: View {
    var body: some View {
        ZStack{
            Badge(symbolColor: .pps8, gradientStart: .pps3, gradientEnd: .pps5, angleDegrees: 270)
                .shadow(radius: 10, x: 10, y: 10)
        }
            
    }
}

struct LayeringShadowsView_Previews: PreviewProvider {
    static var previews: some View {
        LayeringShadowsView()
    }
}
