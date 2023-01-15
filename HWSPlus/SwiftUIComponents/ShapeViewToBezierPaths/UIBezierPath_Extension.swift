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
        
        //ala baja
        path.move(to: CGPoint(x:0.51260025, y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.307219375 , y:0.1818565), controlPoint1: CGPoint(x: 0.2788790416,y:0.478801583), controlPoint2: CGPoint(x: 0.4996933 , y:0.3418903))
        
        path.addCurve(to: CGPoint(x: 0.4 , y:0.239), controlPoint1: CGPoint(x: 0.4 , y:0.21), controlPoint2: CGPoint(x: 0.39999 , y:0.2304))
        
        //ala alta
        path.move(to: CGPoint(x:0.51260025 , y:0.503711875))
        path.addCurve(to: CGPoint(x: 0.3474351666 , y:0.138613916), controlPoint1: CGPoint(x: 0.3305725 , y:0.44388016), controlPoint2: CGPoint(x: 0.488838916 , y:0.31713016))
         
        path.addCurve(to: CGPoint(x: 0.58152475 , y:0.373500375),
                      controlPoint1: CGPoint(x: 0.5637255416 , y:0.239916),
                      controlPoint2: CGPoint(x: 0.3667547083 , y:0.2814527916))
          
        
        path.move(to: CGPoint(x:0.489581916 , y:0.270603))
           path.addCurve(to: CGPoint(x: 0.66563916 , y:0.275), controlPoint1: CGPoint(x: 0.541306375 , y:0.18612116), controlPoint2: CGPoint(x: 0.6157165416 , y:0.1840739583))

        
        // pico pecho
        path.move(to: CGPoint(x:0.6973816 , y:0.28267775))
        path.addCurve(to: CGPoint(x: 0.3595627916 , y:0.5560455416), controlPoint1: CGPoint(x: 0.52007983, y:0.2099337083), controlPoint2: CGPoint(x: 0.66563916, y:0.5560455416))
        
        //cola
        path.move(to: CGPoint(x:0.36 , y:0.5560454166))
        
        path.addCurve(to: CGPoint(x: 0.40156283, y:0.5864182916), controlPoint1: CGPoint(x: 0.319055416, y:0.560268625), controlPoint2: CGPoint(x: 0.39074 , y:0.653519083))
        
        path.addCurve(to: CGPoint(x: 0.40 , y:0.45), controlPoint1: CGPoint(x: 0.41, y:0.42), controlPoint2: CGPoint(x: 0.41 , y:0.49))
        
        
        
       
        return path
    }
    
}


