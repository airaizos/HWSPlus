//
//  ParticlesView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//

import SwiftUI

struct ParticlesView: View {

    let colors: [Color] = [.pps1,.pps2,.pps3,.pps4,.pps5,.pps6,.pps7,.pps8]
    
    var buttons: [RadialButton] {
        [RadialButton(label: "Creation Point", image: Image(systemName: "space"), action: {
            optCreationPoint = UnitPoint(x: Double.random(in: 0...1), y: Double.random(in: 0...1))
        }),
         RadialButton(label: "Range", image: Image(systemName: "shekelsign.square"), action: {
            optCreationRange = CGSize(width: Double.random(in: 0...1), height: Double.random(in: 0...1))
        }),
         RadialButton(label: "Angle", image: Image(systemName: "cone"), action: {
            optAngleRange = Angle(degrees: Double.random(in: 0...360))
        }),
         RadialButton(label: "Rotation", image: Image(systemName: "cone"), action: {
            optRotationRange = Angle(degrees: Double.random(in: 0...360))
        }),
         RadialButton(label: "Speed", image: Image(systemName: "cone"), action: {
            optRotationSpeed = Angle(degrees: Double.random(in: 0...360))
        })
        ]
    }
    
    
    @State private var imageSelection = 0
    let optImages = ["confetti","line","spark"]
    
    @State private var optParticleCount = 50.0
    
    @State private var optCreationPoint = UnitPoint(x: 0.5, y: 0.5)
    
    @State private var optCreationRange = CGSize.zero
    
    @State private var optAngleRange = Angle(degrees: .zero)
    
    @State private var optRotationRange = Angle(degrees: .zero)
    
    @State private var optRotationSpeed = Angle(degrees: .zero)
    
    var body: some View {
        VStack {
            ZStack {
                EmitterView(
                    image: optImages[imageSelection],
                    particleCount: Int(optParticleCount),
                    creationPoint: optCreationPoint,
                    creationRange: optCreationRange,
                    colors: colors,
                    angleRange: optAngleRange,
                    rotationRange: optRotationRange,
                    rotationSpeed: optRotationSpeed,
                    scale: 0.6,
                    scaleRange: 0.1,
                    scaleSpeed: 0.4,
                    //    speed: 1200,
                    //    speedRange: 800
                    animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold:5
                )
                
                
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
       
            VStack {
                
                Picker("Image", selection: $imageSelection) {
                    
                    ForEach(0..<optImages.count) { img in
                        Text(self.optImages[img].uppercased())
                    }
                }
                .pickerStyle(.segmented)
                .foregroundColor(.black)
                
                .background(Color.black)
                .foregroundColor(.black)
               
                HStack {
                    //Particle Count
                    Text("Particules \(optParticleCount, specifier: "%.0f")")
                    Slider(value: $optParticleCount, in: 10...200, step: 20)
                      
                      
                    //creation Point
                    Text("Creation Point")
                    Slider(value: $optParticleCount, in: 10...200, step: 20)
                      

                    /*
                    Text("Rotation Speed")
                    Slider(value:, in: 0...360, step: 30)
                      */
                }
                .background(Color.black)
            }
        RadialMenu(title: "title", closedImage: Image(systemName: "star"), openImage: Image(systemName: "cone"), buttons: buttons)
        }

    
}

struct ParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ParticlesView()
    }
}
