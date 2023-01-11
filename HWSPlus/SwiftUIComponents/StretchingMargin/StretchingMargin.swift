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
        VStack {
            GeometryReader { geo in
                content()
                    .frame(width: width(for: geo), height: geo.size.height)
                    .offset(x: offset(for: geo))
            }
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    
    func width(for proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        return proxy.size.width + max(0, x)
    }
    
    func offset(for proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        return min(0, -x)
    }
}
