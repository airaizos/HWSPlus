//
//  AccelerometerView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//
import CoreMotion
import SwiftUI


struct AccelerometerView: View {
    @EnvironmentObject var motion: MotionManager
    @State var viewType = 0
    var body: some View {
        ZStack {
            switch viewType {
         
            case 0: CirclesView()
            case 1: ScalingMaskView()
            case 2: TextMaskView()
            case 3: StraightImageView()
            case 4: ImageView3D()
            case 5: ShapeBezier2DView()
            default: ScalingMaskView()
            }
        }
        .onTapGesture {
            self.viewType += 1
            if viewType == 6 {
                viewType = 0
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
        
        
}

struct AccelerometerView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
