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
        .zero
    }
    private func separate(from flock: Flock) -> CGPoint {
        .zero
    }
    private func align(from flock: Flock) -> CGPoint {
        .zero
    }
    private func cohere(from flock: Flock) -> CGPoint {
        .zero
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
}

//MARK: Flock
class Flock: ObservableObject {
    // sincroniza el refresco de pantalla con el cálculo de todos los movimientos
    var displayLink: CADisplayLink?
    
    let width: CGFloat
    let height: CGFloat
    
    var boids = [Boid]()
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        
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
    @StateObject var flock = Flock(width: 400, height: 400)
    
    var body: some View {
        ZStack {
            ForEach(flock.boids) { boid in
                Triangle()
                    .rotation(.radians(boid.velocity.heading + (.pi / 2)))
                    .fill(Color.red)
                    .frame(width: 6, height: 12)
                    .position(x:boid.position.x, y: boid.position.y)
            }
        }
        .background(Color(white: 0.2, opacity: 1))
        .frame(width: flock.width, height: flock.height)
        .ignoresSafeArea()
    }
}

struct BoidsView_Previews: PreviewProvider {
    static var previews: some View {
        BoidsView()
    }
}
