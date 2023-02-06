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
    
    @State private var particleMode = 0
    let modes = ["Random","Confetti", "Explosion","Fireflies","Magic","Rain", "Smoke","Snow"]
    
    
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
                switch particleMode {
                case 0:
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
                        speed: 1200,
                        speedRange: 800,
                        animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold:5
                    )
                case 1: //Confetti
                    EmitterView(
                        image: "confetti",
                        particleCount: 50,
                        creationPoint: .init(x: 0.5, y: -0.1),
                        creationRange: CGSize(width: 1, height: 1),
                        colors: [.red, .yellow,.green, .white, .orange, .purple],
                        angle: .degrees(180),
                        angleRange: .radians(.pi / 4),
                        rotationSpeed: .radians(.pi),
                        scale: 0.6,
                        speed: 1200,
                        speedRange: 800,
                        animation: Animation.linear(duration: 5).repeatForever(autoreverses: false),
                        animationDelayThreshold: 5
                        )
                case 2: //Explosion
                    EmitterView(
                    image: "spark",
                    particleCount: 200,
                    colors: [.red],
                    alphaSpeed:  -1,
                    angleRange: .degrees(360),
                    scale: 0.4,
                    scaleRange: 0.1,
                    speed: 60,
                    speedRange: 80,
                    blendMode: .screen
                    )
                case 3: //Fireflies
                    EmitterView(
                        image: "spark",
                        particleCount: 100,
                        creationRange: CGSize(width: 1, height: 1),
                        colors: [.yellow],
                        alphaSpeed: -1,
                        angleRange: .degrees(360),
                        scale: 0.5,
                        scaleRange: 0.2,
                        scaleSpeed: -0.2,
                        speed: 120,
                        speedRange: 120,
                        animation: Animation.easeInOut(duration: 1).repeatForever(autoreverses: false),
                        animationDelayThreshold: 1,
                        blendMode: .screen
                    )
                    
                case 4: //Magic
                    EmitterView(
                        image: "spark",
                        particleCount: 200,
                        colors: [Color(red:0.5, green:1, blue: 1)],
                        alphaSpeed: -1,
                        angleRange: .degrees(360),
                        scale: 0.5,
                        scaleRange: 0.2,
                        scaleSpeed: -0.2,
                        speed: 120,
                        speedRange: 120,
                        animation: Animation.easeOut(duration: 1).repeatForever(autoreverses: false),
                        animationDelayThreshold: 1,
                        blendMode: .screen
                        )
                    
                case 5: //rain
                   
                    EmitterView(
                        image: "line",
                        particleCount: 150,
                        creationPoint: .init(x: 0.5, y: -0.1),
                        creationRange: CGSize(width: 1, height: 0),
                        colors: [Color(red:0.8, green:0.8, blue: 1)],
                        alphaRange: 1,
                        angle: Angle(degrees: 180),
                        scale: 0.6,
                        scaleRange: 0.2,
                        scaleSpeed: -0.2,
                        speed: 800,
                        speedRange: 400,
                        animation: Animation.easeOut(duration: 1).repeatForever(autoreverses: false),
                        animationDelayThreshold: 1
               
                        )
                     
                case 6: //Smoke
                    EmitterView(
                        image: "spark",
                        particleCount: 200,
                        colors: [.gray],
                        alphaSpeed: -1,
                        angleRange: .degrees(90),
                        scale: 0.3,
                        scaleRange: 0.1,
                        scaleSpeed: 1,
                        speed: 100,
                        speedRange: 80,
                        animation: Animation.linear(duration: 3).repeatForever(autoreverses: false),
                        animationDelayThreshold: 3,
                        blendMode: .screen
                    )
                    
                case 7: //snow
                    EmitterView(
                        image: "spark",
                        particleCount: 100,
                        creationPoint: .init(x: 0.5, y: -0.1),
                        creationRange: CGSize(width: 1, height: 0),
                        colors: [.white],
                        alphaRange: 1,
                        angle: .degrees(180),
                        angleRange: .degrees(10),
                        scale: 0.4,
                        scaleRange: 0.4,
                        speed: 1200,
                        speedRange: 1200,
                        animation: Animation.linear(duration: 5).repeatForever(autoreverses: false),
                        animationDelayThreshold: 5
                    )
                default:
                    EmitterView(
                        image: "confetti",
                        particleCount: 50,
                        creationPoint: .init(x: 0.5, y: -0.1),
                        creationRange: CGSize(width: 1, height: 1),
                        colors: [.red, .yellow,.green, .white, .orange, .purple],
                        angle: .degrees(180),
                        angleRange: .radians(.pi / 4),
                        rotationSpeed: .radians(.pi),
                        scale: 0.6,
                        speed: 1200,
                        speedRange: 800,
                        animation: Animation.linear(duration: 5).repeatForever(autoreverses: false),
                        animationDelayThreshold: 5
                        )
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .onLongPressGesture {
                particleMode += 1
            }
        }
       
            VStack {
                Picker("Mode", selection: $particleMode) {
                    ForEach(0..<modes.count) { mode in
                        Text(self.modes[mode])
                    }
                }
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
