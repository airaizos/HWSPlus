//
//  StraightImageView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct StraightImageView: View {
    @EnvironmentObject var motion: MotionManager
    var body: some View {
        ZStack {
            ShapeView(bezier: UIBezierPath.ppsLogo)
                .stroke(Color.pps5, lineWidth: 8)
                .offset(x: -40)
                .frame(width: 500, height: 500)
                .shadow(color: .pps1, radius: motion.fx * 100)
   

                .overlay(
                    Circle()
                        .stroke(Color.pps8, lineWidth: 12)
                )
                .rotationEffect(.init(radians: atan2(motion.dx, motion.dy) + .pi))
        }
        
    }
   
}

struct StraightImageView_Previews: PreviewProvider {
    static var previews: some View {
        StraightImageView()
    }
}
