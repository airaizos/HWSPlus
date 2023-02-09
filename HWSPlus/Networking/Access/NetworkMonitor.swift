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
    var collectedData:(String,Bool) = ("",false)
    
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
    
    /// Waiting for access
    func makeRequest(_ completion: @escaping ((String, Bool) -> Void)) {
        let config = URLSessionConfiguration.default
        config.allowsExpensiveNetworkAccess = false
        config.allowsConstrainedNetworkAccess = false
        config.waitsForConnectivity = true
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: config)
        let url = URL(string: "https://www.proximaparadaswift.dev")!
        
        session.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                completion(data.description, false)
            }
        }.resume()
    }
}
