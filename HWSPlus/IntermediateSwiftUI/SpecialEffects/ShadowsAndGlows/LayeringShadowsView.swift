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
            
            Polygon(sides: 9)
                .stroke(.white, lineWidth: 4)
                
        }
            .background(Color.black)
    }
}

struct LayeringShadowsView_Previews: PreviewProvider {
    static var previews: some View {
        LayeringShadowsView()
    }
}
