//
//  AccessibleStack.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 10/1/23.
//

import SwiftUI

struct AccessibleStack<Content: View>: View {
    @Environment(\.sizeCategory) var size
    
    ///Hay que proporcionar las mismas propiedades que a un HStack y VStack, a los que hay que dar valores por defecto
    var horizontalSpacing: Optional<CGFloat>
    var verticalSpacing: Optional<CGFloat>
    var horizontalAlignment: HorizontalAlignment
    var verticalAlignment: VerticalAlignment
    
    /// En que punto debe cambiar el stack entre Horizontal o Vertical
    var verticalStartSize: ContentSizeCategory
    /// Y el contenido a mostrar como trailing closure
    let content: () -> Content
    
    /// Inicializador personalizado para que el Content sea un viewBuilder, que nos permite pasar varias vistas al mismo tiempo en un solo closure
    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, horizontalSpacing: CGFloat? = nil, verticalSpacing: CGFloat? = nil,  verticalStartSize: ContentSizeCategory = .accessibilityMedium, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.verticalStartSize = verticalStartSize
        self.content = content
    }
    @ViewBuilder var body: some View {
        if size >= verticalStartSize {
            VStack(alignment: horizontalAlignment, spacing: verticalSpacing, content: content)
        } else {
            HStack(alignment: verticalAlignment, spacing: horizontalSpacing, content: content)
        }
    }
}


