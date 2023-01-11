//
//  StretchingHeader.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct StretchingHeader<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                content()
                    .frame(width: geo.size.width, height: height(for: geo))
                    .blur(radius: blur(for: geo))
                    .offset(y: offset(for: geo))
            }
        }
    }
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    
    /// La altura de la vista debe ser la altura de su contenedor  más el mayor de 0 o su posición en el eje Y. Cuando hace scroll hacia abajo **y** se incrementa, asi que el contenedor también.
    func height(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return proxy.size.height + max(0, y)
    }
    
    /// La posición de la que parte el contenedor debe ser el borde superior, al hacer scroll down se debe mantener en la parte superior, y subir cuando se hace scroll up
    func offset(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return min(0, -y)
    }
    
    /// Blur
    func blur(for proxy: GeometryProxy) -> CGFloat {
        proxy.frame(in: .global).minY / 10 - 5
    }
}
