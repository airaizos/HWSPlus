//
//  StretchingMargin.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 11/1/23.
//

import SwiftUI


struct StretchingMargin<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        HStack {
            GeometryReader { geo in
                content()
                    .frame(width: width(for: geo), height: geo.size.height)
                    .blur(radius: blur(for: geo))
                    .offset(x: offset(for: geo))
            }
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    /// Agranda la imagen hasta el máximo del scrollRight
    func width(for proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        return proxy.size.width + max(0, x)
    }
    /// Ancla al margen izquerdo la imagen. En la vista se tiene que añadir .resizable() y .scaleToFill
    func offset(for proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        return min(0, -x)
    }
    
    /// Difumina la imagen conforme se hace scrollRigth
    func blur(for proxy: GeometryProxy) -> CGFloat {
         proxy.frame(in: .global).minX / 10 - 5
        
    }
}
