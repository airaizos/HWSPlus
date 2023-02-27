//
//  extensionURLSession.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 27/2/23.
//

import Foundation

//URL Session que nunca usa el caché
extension URLSession {
    static let noCacheSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        return URLSession(configuration: config)
    }()
}


struct RemoteFile<T: Decodable> {
    let url: URL
    let type: T.Type
    
    var contents: T {
        get async throws {
            let (data, _) = try await
            URLSession.noCacheSession.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}


struct MessageP: Decodable, Identifiable {
    let id:Int
    let user:String
    let text:String
}
