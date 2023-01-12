//
//  RadialMenu.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 12/1/23.
//

import SwiftUI

struct RadialMenu: View {
    @State private var isExpanded = false
    @State private var isShowingSheet = false
    
    //MARK: Variables
    var title: String
    let closedImage: Image
    let openImage: Image
    let buttons: [RadialButton]
    var direction = Angle(degrees: 315)
    var range = Angle(degrees: 90)
    var distance = 100.0
    var animation = Animation.default
    
    //MARK: View
    
    var body: some View {
        ZStack {
            Button {
                if UIAccessibility.isVoiceOverRunning {
                    isShowingSheet.toggle()
                }
                isExpanded.toggle()
            } label: {
                isExpanded ? openImage : closedImage
            }
            .buttonStyle(CustomButtonStyle())
            .accessibility(label: Text(title))
            
            // Radial buttons
            
            ForEach(0..<buttons.count, id: \.self) {  i in
                Button {
                    buttons[i].action()
                    isExpanded.toggle()
                } label: {
                    buttons[i].image
                }
                .accessibility(hidden: isExpanded == false)
                .accessibility(label: Text(buttons[i].label))
                .offset(offset(for: i))
                .animation(animation.delay(Double(i) / 10), value: isExpanded == false)
            }
            .buttonStyle(CustomButtonStyle())
            .opacity(isExpanded ? 1 : 0)
           
            
        }
    //TODO: Deprecated .confirmationDialog("", isPresented: $isShowingSheet) {
        .actionSheet(isPresented: $isShowingSheet) {
            ActionSheet(title: Text(title), buttons:
                            buttons.map { btn in
                ActionSheet.Button.default(Text(btn.label), action: btn.action) } + [.cancel()]
            )
        }
    }
    
    
    //MARK: Functions
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
