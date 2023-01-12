//
//  RadialMenu.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.
//

import SwiftUI

struct RadialMenu: View {
    @State private var isExpanded = false
    
    var title: String
    let closedImage: Image
    let openImage: Image
    let buttons: [RadialButton]
    var direction = Angle(degrees: 315)
    var range = Angle(degrees: 90)
    var distance = 100.0
    var animation = Animation.default
   
    
    func offset(for index: Int) -> CGSize {
        guard isExpanded else { return .zero }
        
        /// En que ángulo debe aparecer el botón
        let buttonAngle = range.radians / Double(buttons.count - 1)
        
        /// Cuánto ángulo debe usar cada botón
        let ourAngle = buttonAngle * Double(index)
        
        ///  En que dirección se debe mostrar el bótón
        let finalAngle = direction - (range / 2 ) + Angle(radians: ourAngle)
        
        /// Cambiar la posición por defecto de SwiftUI hacia arriba y establecer la distancia del botón central
        let finalX = cos(finalAngle.radians - .pi / 2) * distance
        let finalY = sin(finalAngle.radians - .pi / 2) * distance
        
        return CGSize(width: finalX, height: finalY)
    }
}
