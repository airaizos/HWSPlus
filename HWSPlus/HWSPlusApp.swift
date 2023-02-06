//
//  HWSPlusApp.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 15/12/22.
//

import SwiftUI

@main
struct HWSPlusApp: App {
    let motionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(motionManager)
        }
    }
}
