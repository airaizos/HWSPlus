//
//  Wave.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/1/23.
//

import SwiftUI

struct Wave: Shape {

    // que tan altas son
    var strength: Double
    
    // que tan frecuentes son
    var frecuency: Double
    
    // cuanto tiene de offset horizontalmente
    var phase: Double
    
    // permite a SwiftUI animar la fase de la ola
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        
        let oneOverMidWidth = 1 / midWidth
        
        
        // divide el ancho total entre la frecuencia
        let wavelength = width / frecuency
        
        // empieza a la izquierda a la mitad
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through:  width, by: 10) {
            //encuentra la posición actual relativa a la ancho de wave
            let relativeX = x / wavelength
            
            /// Seno: (sen) una de las 6 funciones trigonoméstricas llamadas también funciones circulares. Proyección de la línea del ángulo al eje Y
            let sine = sin(relativeX + phase)
            
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            let parabola = -(normalDistance * normalDistance) + 1
            
            // multiplica el seno por la altura y le suma para ir al centro
            let y = parabola * strength * sine + midHeight
            
            // pinta la linea
           path.addLine(to: CGPoint(x: x, y: y))
        }
        return Path(path.cgPath)
    }
}
