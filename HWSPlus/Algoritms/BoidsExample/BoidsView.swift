// bird-oid object
//  BoidsView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/1/23.
//

import SwiftUI

//MARK: Boid
class Boid: Identifiable {
    let id = UUID()
    let color: Color = [.green, .white, .red,.yellow, .orange, .blue, .purple].randomElement()!
    
    var position: CGPoint
    var velocity: CGPoint
    let maximumSpeed: CGFloat = 2
    
    init(x: CGFloat, y: CGFloat) {
        position = CGPoint(x: x, y: y)
        
        let angle = Double.random(in: 0...(.pi * 2))
        velocity = CGPoint(x: cos(angle), y: sin(angle))
    }
    
    func run(in flock: Flock) {
        velocity += calculateAcceleration(with: flock)
        velocity.limit(to: maximumSpeed)
        position += velocity
        wrap(in: flock)
    }
    
    private func calculateAcceleration(with flock: Flock) -> CGPoint {
        var acceleration: CGPoint = .zero
        if flock.separate { acceleration += separate(from: flock) * 1.5 }
        if flock.align { acceleration += align(from: flock) }
        if flock.cohere { acceleration += cohere(from: flock) }
        if flock.avoid { acceleration += avoid(flock.obstacle) * 10 }
        
        return acceleration
    }
    private func separate(from flock: Flock) -> CGPoint {
        //encuentra a otros que estén al menos a 30² puntos de mi
        let nerby = neighbors(in: flock, distanceCutOff: 900)
        
        //si no hay ninguno, no se ajusta la separación
        guard nerby.count > 0 else { return .zero }
        
        //calcula un solo valor, empeiza por 0
        var acceleration = nerby.reduce(CGPoint.zero) {
            //encuentra la diferencia de X/Y entre yo y otro boid
            var difference = position - $1.boid.position
            //difive la diferencia entre la distancia, entre más lejos, menos importancia
            difference /= $1.distance
            //suma esa diferencia
            return $0 + difference
        }
        // obtén un promedio de la aceleración y la cantidad de vecinos
        acceleration /= CGFloat(nerby.count)
        
        // eso esa nuestro direccionamiento
        return steer(acceleration)
    }
    
    private func align(from flock: Flock) -> CGPoint {
        let nearby = neighbors(in: flock, distanceCutOff: 2500)
        guard nearby.count > 0 else { return .zero }
        
        var acceleration = nearby.reduce(CGPoint.zero) {
            $0 + $1.boid.velocity
        }
        acceleration /= CGFloat(nearby.count)
        return steer(acceleration)
    }
    
    private func cohere(from flock: Flock) -> CGPoint {
        
        let nearby = neighbors(in: flock, distanceCutOff: 2500)
        
        guard nearby.count > 0 else { return .zero }
        
        var acceleration = nearby.reduce(CGPoint.zero) {
            $0 + $1.boid.position
        }
        
        acceleration /= CGFloat(nearby.count)
        acceleration -= position
        
        return steer(acceleration)
        
    }
    
    private func wrap(in flock: Flock) {
        //atrapar a los boids en el frame
        let boidSize : CGFloat = 5
        if position.x < -boidSize {
            position.x = flock.width + boidSize
        } else if position.x > flock.width + boidSize {
            position.x = -boidSize
        }
        
        if position.y < -boidSize {
            position.y = flock.height + boidSize
        } else if position.y > flock.height + boidSize {
            position.y = -boidSize
        }
    }
    
    private func neighbors(in flock: Flock, distanceCutOff: CGFloat) -> [(boid: Boid, distance: CGFloat )] {
        
        flock.boids.compactMap { other in
            
            // si está activo el teamMode y mi color es diferente del otro, no es mi vecino.
            if flock.teamMode == true && self.color != other.color { return nil }
            
            
            let distance = position.distanceSquare(from: other.position)
            
            if distance > 0 && distance < distanceCutOff {
                return (other, distance)
            } else {
                return nil
            }
        }
    }
    
    private func steer(_ acceleration: CGPoint) -> CGPoint {
        var acceleration = acceleration
        acceleration.normalize()
        acceleration *= maximumSpeed
        acceleration -= velocity
        
        let maximumSteer: CGFloat = 0.04
        acceleration.limit(to: maximumSteer)
        return acceleration
    }
    
    private func avoid(_ obstacle: CGPoint) -> CGPoint {
        // cuanta distancia hay entre el obstáculo y el boid
        let distance = position.distanceSquare(from: obstacle)
        let distanceCutOff: CGFloat = 750
        
        //si esta lejos, al boid no le afecta
        guard distance < distanceCutOff else { return .zero }
        
        //entre más cerca esté, más nos preocuparemos
        var acceleration = position - obstacle
        acceleration /= distance
        
        //acelera en otra dirección
        return steer(acceleration)
    }
    
}

//MARK: Flock
class Flock: ObservableObject {
    // sincroniza el refresco de pantalla con el cálculo de todos los movimientos
    var displayLink: CADisplayLink?
    
    let width: CGFloat
    let height: CGFloat
    
    var boids = [Boid]()
    var teamMode = false
    
    var obstacle: CGPoint
    
    var separate = true
    var align = true
    var cohere = true
    var avoid = true
    
    func changeSeparate() {
        separate.toggle()
    }
    func changeAlign() {
        align.toggle()
    }
    func changeCohere() {
        cohere.toggle()
    }
    func changeAvoid() {
        avoid.toggle()
    }
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        
        obstacle = CGPoint(x: width / 2, y: height / 2)
        for _ in 1...100 {
            let newBoid = Boid(x: CGFloat.random(in: 0..<width), y: CGFloat.random(in: 0..<height))
            boids.append(newBoid)
        }
        
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .current, forMode: .default)
        
    }
    //displayLink
    @objc func update() {
        objectWillChange.send()
        for boid in boids {
            boid.run(in: self)
        }
    }
}
//MARK: BoidsView
struct BoidsView: View {
    @StateObject var flock = Flock(width: 800, height: 800)
    
    var body: some View {
        VStack {
            HStack {
                Button("Align", action: flock.changeAlign)
                    .foregroundColor(flock.align ? .blue : .red)
                Button("Separate", action: flock.changeSeparate)
                    .foregroundColor(flock.separate ? .blue : .red)
                Button("Cohere", action: flock.changeCohere)
                    .foregroundColor(flock.cohere ? .blue : .red)
                Button("Avoid", action: flock.changeAvoid)
                    .foregroundColor(flock.avoid ? .blue : .red)
            }
            ZStack {
                ForEach(flock.boids) { boid in
                    Triangle()
                        .rotation(.radians(boid.velocity.heading + (.pi / 2)))
                        .fill(flock.teamMode ? boid.color : .pink)
                        .frame(width: 6, height: 12)
                        .position(x:boid.position.x, y: boid.position.y)
                }
                
                Circle()
                    .fill(Color.cyan)
                    .frame(width: 25, height: 25)
                    .position(flock.obstacle)
            }
            .background(Color(white: 0.2, opacity: 1))
            .frame(width: flock.width, height: flock.height)
            .ignoresSafeArea()
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged {value  in
                        flock.obstacle = value.location
                    }
                
            )
            
            .onTapGesture {
                flock.teamMode.toggle()
            }
        }
    }
}

struct BoidsView_Previews: PreviewProvider {
    static var previews: some View {
        BoidsView()
    }
}
