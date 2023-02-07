//
//  TextMaskView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct TextMaskView: View {
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        Circle()
            .fill(AngularGradient(gradient: Gradient(colors: [.pps1,.pps2,.pps3,.pps4,.pps5,.pps6,.pps7,.pps8,.pps1]), center: .center))
            .blur(radius: 20)
            .rotationEffect(.radians(motion.dx + motion.dy) * 2)
            .saturation(motion.dy * -3)
            .mask(
                Text("Próxima parada Swift")
                    .foregroundColor(.white)
                    .font(.system(size: 160, weight: .black, design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        
    }
}

struct TextMaskView_Previews: PreviewProvider {
    static var previews: some View {
        TextMaskView()
    }
}
