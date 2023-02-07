//
//  ScalingMaskView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 7/2/23.
//

import SwiftUI

struct ScalingMaskView: View {
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        Image("pps")
            .scaledToFit()
            .clipShape(Circle())
            .mask(
                Circle()
                    .scaleEffect(max(0, -motion.fy * 2))
            )
    }
}

struct ScalingMaskView_Previews: PreviewProvider {
    static var previews: some View {
        ScalingMaskView()
    }
}
