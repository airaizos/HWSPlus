//
//  EmitterView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//

import SwiftUI

struct EmitterView: View {
    private struct ParticleView: View {
        @State private var isActive = false
        
        let image: Image
        let position: ParticleState<CGPoint>
        let opacity: ParticleState<Double>
        let scale: ParticleState<CGFloat>
        let rotation: ParticleState<Angle>
        let color: Color
        let animation: Animation
        let blendMode : BlendMode
        
        var body: some View {
            image
            /// Tener cuidado con el orden de los modificadores
                .colorMultiply(color)
                .blendMode(blendMode)
                .opacity(isActive ? opacity.end : opacity.start)
                .scaleEffect(isActive ? scale.end : scale.start)
                .position(isActive ? position.end : position.start)
                .rotationEffect(isActive ? rotation.end : rotation.start)
                .onAppear {
                    withAnimation(self.animation) {
                        self.isActive = true }
                }
        }
    }
    
    private struct ParticleState<T> {
        var start: T
        var end: T
        
        init(_ start: T, _ end: T) {
            self.start = start
            self.end = end
        }
    }
    
    var image: String //✅
    var particleCount: Int //✅
    
    var creationPoint = UnitPoint.center //✅
    var creationRange = CGSize.zero //✅
    
    var colors = [Color.pps1] //✅
  
    var alpha: Double = 1
    var alphaRange: Double = 0 
    var alphaSpeed: Double  = 0
    
    var angle = Angle.zero
    var angleRange = Angle.zero //✅
    
    var opacity = 1.0
    var opacityRange = 0.0
    var opacitySpeed = 0.0
    
    var rotation = Angle.zero
    var rotationRange = Angle.zero
    var rotationSpeed = Angle.zero
    
    
    var scale: CGFloat = 1
    var scaleRange: CGFloat = 0
    var scaleSpeed: CGFloat = 0
    
    var speed = 50.0
    var speedRange = 0.0
    
    var animation = Animation.linear(duration: 1).repeatForever(autoreverses: false)
    var animationDelayThreshold = 0.0
    
    var blendMode = BlendMode.normal
    
    var body: some View {
        
        ///Geometry Reader: A container view that defines its content as a function of its own size and coordinate space. This view returns a flexible preferred size to its parent layout.
        GeometryReader { geo in
            ZStack {
                ForEach(0..<self.particleCount, id: \.self) { _ in
                    ParticleView(
                        image: Image("\(self.image)"),
                        position: self.position(in: geo),
                        opacity: self.makeOpacity(),
                        scale: self.makeScale(),
                        rotation: self.makeRotation(),
                        color: self.colors.randomElement() ?? .white,
                        animation: self.animation.delay(Double.random(in: 0...self.animationDelayThreshold)),
                        blendMode: self.blendMode 
                    )
                }
            }
        }
    }
    
    private func position(in proxy: GeometryProxy) -> ParticleState<CGPoint> {
     //   ParticleState(.zero, .zero)
        
        //Que tanta variedad va a haber en cuanto a los ejes x , y
        
        // Donde va a posicionarse al inicio, una variación respecto al tamaño del contenedor
        let halfCreationRangeWidth = creationRange.width / 2
        let halfCreationRangeHeight = creationRange.height / 2
        
        let creationOffsetX = CGFloat.random(in: -halfCreationRangeWidth...halfCreationRangeWidth)
        let creationOffsetY = CGFloat.random(in: -halfCreationRangeHeight...halfCreationRangeHeight)
        
        let startX = Double(proxy.size.width * (creationPoint.x + creationOffsetX))
        let startY = Double(proxy.size.height * (creationPoint.y + creationOffsetY))
        let start = CGPoint(x: startX, y: startY)
        
        // Añadimos diferentes velocidades, partiendo de la velocidad establecida más un rango entre menos la mitad y más la mitad
        let halfSpeedRange = speedRange / 2
        let actualSpeed = speed + Double.random(in: -halfSpeedRange...halfSpeedRange)
        
        // Añadimos diferentes ángulos
        let halfAngleRange = angleRange.radians / 2
        let actualDirection = angle.radians + Double.random(in: -halfAngleRange...halfAngleRange)
        
        // Establecemos la posición final
        let finalX = cos(actualDirection - .pi / 2 ) * actualSpeed
        let finalY = sin(actualDirection - .pi / 2 ) * actualSpeed
        let end = CGPoint(x: startX + finalX, y: startY + finalY)
        return ParticleState(start, end)
    }
    
    
    /// Dos métodos que tienen que ir en el struct ParticuleView
    private func makeOpacity() -> ParticleState<Double> {
        let halfOpacityRange = opacityRange / 2
        let randomOpacity = Double.random(in: -halfOpacityRange...halfOpacityRange)
        return ParticleState(opacity + randomOpacity, opacity + opacitySpeed + randomOpacity)
    }
    
    private func makeScale() -> ParticleState<CGFloat> {
        let halfScaleRange = scaleRange / 2
        let randomScale = Double.random(in: -halfScaleRange...halfScaleRange)
        return ParticleState(scaleRange + randomScale, scaleRange + scaleSpeed + randomScale)
    }
    
    private func makeRotation() -> ParticleState<Angle> {
        let halfRotationRange = (rotationRange / 2).radians
        let randomRotationAngle = Angle(radians: Double.random(in: -halfRotationRange...halfRotationRange))
        return ParticleState(rotation + randomRotationAngle, rotation + rotationSpeed + randomRotationAngle)
    }
    
}
