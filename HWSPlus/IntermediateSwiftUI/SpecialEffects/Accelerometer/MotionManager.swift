//
//  MotionManager.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 6/2/23.
//

import CoreMotion

class MotionManager: ObservableObject {
    private let monitorManager = CMMotionManager()
    
    var fx: CGFloat = 0
    var fy: CGFloat = 0
    var fz: CGFloat = 0
    
    var dx: Double = 0
    var dy: Double = 0
    var dz: Double = 0
    
    init() {
        monitorManager.startDeviceMotionUpdates(to: .main)  { data,_ in
            guard let newData = data?.gravity else { return }
            self.dx = newData.x
            self.dy = newData.y
            self.dz = newData.z
            
            self.fx = newData.x
            self.fy = newData.y
            self.fz = newData.z
            
            self.objectWillChange.send()
            
        }
    }
    
    func start() {
        monitorManager.startDeviceMotionUpdates(to: .main)  { data,_ in
            guard let newData = data?.gravity else { return }
            self.dx = newData.x
            self.dy = newData.y
            self.dz = newData.z
            
            self.fx = newData.x
            self.fy = newData.y
            self.fz = newData.z
            
            self.objectWillChange.send()
        }
    }
    
    func shutDown() {
        monitorManager.stopDeviceMotionUpdates()
    }
}
