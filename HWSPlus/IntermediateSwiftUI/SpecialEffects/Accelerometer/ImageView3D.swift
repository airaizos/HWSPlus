//
//  ImageView3D.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct ImageView3D: View {
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        ZStack {
            ShapeView(bezier: UIBezierPath.ppsLogo)
                .stroke(Color.pps8, lineWidth: 4)
                .frame(width: 400,height: 400)
                .overlay(
                    Circle()
                        .stroke( Color.pps1, lineWidth: 8)
                )
                .rotation3DEffect(.radians(.pi), axis: (motion.fx, motion.fy, motion.fz + 0.5))
        }
        
    }
}

struct ImageView3D_Previews: PreviewProvider {
    static var previews: some View {
        ImageView3D()
    }
}
