//
//  PPSShape.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI


struct PPSLogo: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x:0.51260025, y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.307219375 , y:0.1818565), control1: CGPoint(x: 0.2788790416,y:0.478801583), control2: CGPoint(x: 0.4996933 , y:0.3418903))
        
        path.addCurve(to: CGPoint(x: 0.4 , y:0.239), control1: CGPoint(x: 0.4 , y:0.21), control2: CGPoint(x: 0.39999 , y:0.2304))
        
        //ala alta
        path.move(to: CGPoint(x:0.51260025 , y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.3474351666 , y:0.138613916), control1: CGPoint(x: 0.3305725 , y:0.44388016), control2: CGPoint(x: 0.488838916 , y:0.31713016))
        
        path.addCurve(to: CGPoint(x: 0.58152475 , y:0.373500375),
                      control1: CGPoint(x: 0.5637255416 , y:0.239916),
                      control2: CGPoint(x: 0.3667547083 , y:0.2814527916))
        
        
        path.move(to: CGPoint(x:0.489581916 , y:0.270603))
        path.addCurve(to: CGPoint(x: 0.66563916 , y:0.275), control1: CGPoint(x: 0.541306375 , y:0.18612116), control2: CGPoint(x: 0.6157165416 , y:0.1840739583))
        
        
        // pico pecho
        path.move(to: CGPoint(x:0.6973816 , y:0.28267775))
        path.addCurve(to: CGPoint(x: 0.3595627916 , y:0.5560455416), control1: CGPoint(x: 0.52007983, y:0.2099337083), control2: CGPoint(x: 0.66563916, y:0.5560455416))
        
        //cola
        path.move(to: CGPoint(x:0.36 , y:0.5560454166))
        
        path.addCurve(to: CGPoint(x: 0.40156283, y:0.5864182916), control1: CGPoint(x: 0.319055416, y:0.560268625), control2: CGPoint(x: 0.39074 , y:0.653519083))
        
        path.addCurve(to: CGPoint(x: 0.40 , y:0.45), control1: CGPoint(x: 0.41, y:0.42), control2: CGPoint(x: 0.41 , y:0.49))
        
        return path
    }
    
    
    
}
