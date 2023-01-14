//
//  ShapeBezierView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/1/23.
//

import SwiftUI

struct ShapeView: Shape {
    let bezier: UIBezierPath
    func path(in rect: CGRect) -> Path {
        let path = Path(bezier.cgPath)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
    
}

struct ShapeBezierView: View {
    @State private var endAmount: CGFloat = 0
    @State private var phase = 0.0
    
    
    var body: some View {
        VStack {
            
            ShapeView(bezier: UIBezierPath.ppsLogo)
                .trim(from: 0, to: 1)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 400, height: 400)
            
       /*     ShapeView(bezier: UIBezierPath.unwrapLogo)
                .trim(from: 0, to: endAmount)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 200, height: 200)
       
        ZStack {
            ForEach(0..<10) { i in
                Wave(strength: 50, frecuency: 20, phase: self.phase)
                    .stroke(Color.white.opacity(Double(i) / 15), lineWidth: 5)
                    .offset(y: CGFloat(i) * 7)
            }
        }
                .mask(LinearGradient(colors: [.clear,.white,.clear], startPoint: .leading, endPoint: .trailing)
                      )
                .background(Color.blue)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                                self.endAmount = 1
                                self.phase = .pi * 2
                            
                        
                }
            }*/
        }
        
     
    }
}

struct ShapeBezierView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBezierView()
    }
}
