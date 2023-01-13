//
//  UIBezierPath_Extension.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/1/23.
//

import SwiftUI

extension UIBezierPath {
    static var unwrapLogo: UIBezierPath {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0.534, y: 0.5816))
        path.addCurve(to: CGPoint(x: 0.1877, y: 0.088), controlPoint1: CGPoint(x: 0.5334, y: 0.5816), controlPoint2: CGPoint(x: 0.2529, y: 0.4205))
        path.addCurve(to: CGPoint(x: 0.9728, y: 0.8259), controlPoint1: CGPoint(x: 0.4922, y: 0.4949), controlPoint2: CGPoint(x: 1.0968, y: 0.4148))
        path.addCurve(to: CGPoint(x: 0.0397, y: 0.5431), controlPoint1: CGPoint(x: 0.7118, y: 0.5248), controlPoint2: CGPoint(x: 0.3329, y: 0.7442))
        path.addCurve(to: CGPoint(x: 0.6211, y: 0.0279), controlPoint1: CGPoint(x: 0.508, y: 1.1956), controlPoint2: CGPoint(x: 1.3042, y: 0.5345))
        path.addCurve(to: CGPoint(x: 0.6904, y: 0.3615), controlPoint1: CGPoint(x: 0.7282, y: 0.2481), controlPoint2: CGPoint(x: 0.6904, y: 0.3615))
        
        
        return path
    }
    
    static var ppsLogo: UIBezierPath {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x:0.51260025, y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.307219375 , y:0.1818565), controlPoint1: CGPoint(x: 0.278879041666667,y:0.478801583333333), controlPoint2: CGPoint(x: 0.499693333333333 , y:0.341890333333333))
        path.addCurve(to: CGPoint(x: 0.344977458333333 , y:0.241956416666667), controlPoint1: CGPoint(x: 0.320210291666667 , y:0.230494583333333), controlPoint2: CGPoint(x: 0.33336725 , y:0.237563583333333))
        
        path.move(to: CGPoint(x:0.51260025 , y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.347435166666667 , y:0.138613916666667), controlPoint1: CGPoint(x: 0.3305725 , y:0.443880166666667), controlPoint2: CGPoint(x: 0.488838916666667 , y:0.317130166666667))
        path.addCurve(to: CGPoint(x: 0.58152475 , y:0.373500375), controlPoint1: CGPoint(x: 0.366754708333333 , y:0.281452791666667), controlPoint2: CGPoint(x: 0.563725541666667 , y:0.239916))
        
        
        path.move(to: CGPoint(x:0.489581916666667 , y:0.270603))
        path.addCurve(to: CGPoint(x: 0.665639166666667 , y:0.270603), controlPoint1: CGPoint(x: 0.541306375 , y:0.186121166666667), controlPoint2: CGPoint(x: 0.615716541666667 , y:0.184073958333333))
        
        
        path.move(to: CGPoint(x:0.697381666666667 , y:0.28267775))
        path.addCurve(to: CGPoint(x: 0.359562791666667 , y:0.556045541666667), controlPoint1: CGPoint(x: 0.520079833333333 , y:0.209933708333333), controlPoint2: CGPoint(x: 0.665639166666667 , y:0.556045541666667))
        
        
        path.move(to: CGPoint(x:0.359562916666667 , y:0.556045416666667))
        path.addCurve(to: CGPoint(x: 0.401562833333333 , y:0.586418291666667), controlPoint1: CGPoint(x: 0.319055416666667 , y:0.560268625), controlPoint2: CGPoint(x: 0.39074 , y:0.653519083333333))
        path.addCurve(to: CGPoint(x: 0.429315083333333 , y:0.404776625), controlPoint1: CGPoint(x: 0.415439 , y:0.438962041666667), controlPoint2: CGPoint(x: 0.408479625 , y:0.543864))
        
        return path
    }
    
}


