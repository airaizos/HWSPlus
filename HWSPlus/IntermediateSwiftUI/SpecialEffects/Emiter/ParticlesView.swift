//
//  ParticlesView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//

import SwiftUI

struct ParticlesView: View {
    @State private var particleMode = 0
    let modes = ["Confetti","Explosion", "Fireflies", "Magic","Rain","Smoke","Snow"]
    
    var body: some View {
        VStack {
            ZStack {
                
                switch particleMode {
                case 0:
                    EmitterView(
                        images: ["confetti"],
                        particleCount: 50,
                        creationPoint: .init(x: 0.5, y: 0.5),
                        creationRange: CGSize(width: 1, height: 10),
                        colors: [.red, .blue],
                        angleRange: Angle(radians: .pi / 4),
                        rotationRange: Angle(radians: .pi * 2), rotationSpeed: Angle(radians:  .pi),
                        scale: 0.6,
                        scaleRange: 0.1,
                        scaleSpeed: 0.4,
                    //    speed: 1200,
                    //    speedRange: 800
                        animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold:5
                    )
                case 1:
                    EmitterView(
                        images: ["spark"],
                        particleCount: 200,
                        colors: [.red],
                        alphaSpeed: -1, angleRange: .degrees(360),
                        scale: 0.4, scaleRange: 0.1, scaleSpeed: 0.3,
                        speed: 60,
                        speedRange: 80,
                        blendMode: .screen)
                case 2:
                    EmitterView(
                        images: ["spark"],
                        particleCount: 50,
                        creationPoint: UnitPoint(x: 0, y: 0),
                        creationRange: CGSize(width: 2, height: 4),
                        colors: [.red, .blue],
                        alpha: 0.7,
                        alphaRange: 0.9,
                        alphaSpeed: 0.2,
                        angle: Angle(radians: 60),
                        angleRange: Angle(radians: 270),
                        opacity: 0.5,
                        opacityRange: 1,
                        opacitySpeed: 0.2,
                        rotation: Angle(radians: 30),
                        rotationRange: Angle(radians: 270),
                        rotationSpeed: Angle(radians: 30),
                        scale: 0.8,
                        scaleRange: 1,
                        scaleSpeed: 1,
                        speed: 700,
                        speedRange: 300,
                  //      animation: .easeInOut(duration: 1),
                        animationDelayThreshold: 5,
                        blendMode: .colorBurn)
                case 3:
                    EmitterView(
                        images: ["spark"], particleCount: 50)
                default:
                    EmitterView(
                        images: ["Confetti"],
                        particleCount: 50,
                        colors: [.pps6],
                       
                        angleRange: .degrees(360),
                        opacitySpeed: -1,
                        scale: 0.4,
                        scaleRange: 0.1,
                        scaleSpeed: 0.4,
                        speedRange: 80,
                        blendMode: .screen)
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
        
        Picker("Select a Mode", selection: $particleMode) {
            
            ForEach(0..<modes.count) { mode in
                Text(self.modes[mode])
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct ParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ParticlesView()
    }
}
