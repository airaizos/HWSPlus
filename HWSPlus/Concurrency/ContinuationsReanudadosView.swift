//
//  ContinuationsReanudadosView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 28/2/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI



@MainActor
final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationContinuation: CheckedContinuation<CLLocationCoordinate2D?,Error>?
    let manager = CLLocationManager()
    
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() async throws -> CLLocationCoordinate2D? {
        try await withCheckedThrowingContinuation { continuation in
            locationContinuation = continuation
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationContinuation?.resume(returning: locations.first?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
    }
}




struct ContinuationsReanudadosView: View {
    
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        LocationButton {
            Task {
                if let location = try? await locationManager.requestLocation() {
                    print("Location \(location)")
                } else {
                    print("location Unknown")
                }
            }
        }
        .frame(height: 44)
        .foregroundColor(.white)
        .clipShape(Capsule())
        .padding()
    }
}

struct ContinuationsReanudadosView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationsReanudadosView()
    }
}
