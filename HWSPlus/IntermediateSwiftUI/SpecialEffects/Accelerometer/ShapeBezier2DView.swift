//
//  ShapeBezierView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct Shape2DView: Shape {
    let bezier: UIBezierPath
    
    func path(in rect: CGRect) -> Path {
        let path = Path(bezier.cgPath)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}

struct ShapeBezier2DView: View {
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        Shape2DView(bezier: .ppsLogo)
            .trim(from: 0, to: -motion.fy * 2)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, dash: [8, 12],dashPhase: 0))
            .foregroundColor(.pps1)
            .frame(width: 400, height: 400)
    }
}

struct ShapeBezier2DView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBezier2DView()
    }
}
