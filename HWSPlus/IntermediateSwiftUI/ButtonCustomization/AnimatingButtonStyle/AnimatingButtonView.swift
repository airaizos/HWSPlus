//
//  AnimatingButtonStyle.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 2/2/23.
//

import SwiftUI

struct AnimatingButtonView: View {
    @State private var animation = 0.0
    
    var body: some View {
        VStack(spacing: 50) {
            HStack(spacing: 80) {
                AnimatedButton(animationSpeed: 1, action: {
                    print("Animation")
                }, label: {
                    Image(systemName: "livephoto")
                        .font(.largeTitle)
                })
                
                
                Button {
                    print("Right")
                } label: {
                    Image(systemName: "livephoto")
                        .font(.largeTitle)
                }
                
                .padding()
                .background(Color.pps8)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(4)
                
                .overlay(
                    Circle()
                        .stroke(Color.pps7, lineWidth: 2)
                        .scaleEffect(CGFloat(1 + animation))
                        .opacity(1 - animation)
                )
                .onAppear {
                    withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
                        animation = 1
                        
                    }
                }
            }
      
            HStack {
                AnimatedProtocolButton(animationSpeed: 1, buttonStyle: PulsingProtocolButtonStyle.self) {
                    print("Protocol")
                } label: {
                  
                    Image(systemName: "livephoto")
                        .clipShape(Ellipse())
                        .frame(width: 200)
                }
                
            }
            HStack {
                AnimatedProtocolButton(animationSpeed: 10, buttonStyle: SpinningArcButtonStyle.self) {
                    print("Spinning")
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                        .font(.largeTitle)
                }
    
                AnimatedProtocolButtonV2(buttonStyle: SpinningArcButtonStyle.self, animationType: .spring(dampingFraction: 0.5).repeatForever(autoreverses: true)) {
                    print("Challenge")
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                }

            }
        }

   
    }
}

struct AnimatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingButtonView()
    }
}
