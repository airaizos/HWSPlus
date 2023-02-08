//
//  NetworkMonitor.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import Network
import Foundation

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    /// ¿Tenemos acceso a internet?
    var isActive = false
    
    /// Es internet Móvil, Wifi o un punto de acceso personal?
    var isExpensive = false
    
    /// Está en Modo de datos reducidos
    var isConstrained = false
    
    var connectionType = NWInterface.InterfaceType.other
    
    init() {
    //    NWConnection(message: .default)
        
        monitor.pathUpdateHandler = .some({ newPath in
            self.isActive = newPath.status == .satisfied
            self.isExpensive = newPath.isExpensive
            self.isConstrained = newPath.isConstrained
            
            let connectionTypes: [NWInterface.InterfaceType] = [.cellular,.wifi, .wiredEthernet]
            self.connectionType = connectionTypes.first(where: newPath.usesInterfaceType) ?? .other
            
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        })   
        monitor.start(queue: queue)
    }
}
