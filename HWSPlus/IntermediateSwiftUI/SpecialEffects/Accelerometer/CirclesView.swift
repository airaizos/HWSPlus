//
//  CirclesView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//

import SwiftUI

struct CirclesView: View {
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pps1)
                .frame(width: 300, height: 300)
                .offset(x: 0, y: motion.fy * 200)
                .blendMode(.screen)
            
                
            Circle()
                .fill(Color.pps7)
                .frame(width: 300,height: 300)
                .offset(x: motion.fy * 200, y: motion.fy * -200)
                .blendMode(.colorBurn)
            
            Circle()
                .fill(Color.pps4)
                .frame(width: 300, height: 300)
                .offset(x: motion.fy * -200, y: motion.fy * -200)
                .blendMode(.difference)

        }
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
    }
}
