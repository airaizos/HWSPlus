//
//  NetworkSession.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import Combine
import Foundation


class NetworkSession {
    
   var requests = Set<AnyCancellable>()
    
    func fetchDataTask(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("** NETWORK ** Error:\n  \(Post.default.title.rendered)")
                print(error.localizedDescription)
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let post = try decoder.decode(Post.self, from: data)
                    print("** NETWORK ** Decodificado:\n \(post.title.rendered)")
                } catch {
                    print("** NETWORK ** Error:\n \(Post.default.title.rendered)")
                   
                }
            }
        }.resume()
    }
    
    /// #Utilizando Combine
    func fetchPublisher(_ url: URL) {
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Post.self, decoder: decoder)
            .replaceError(with: Post.default)
            .sink(receiveValue: { print( "** COMBINE **:\n\($0.title.rendered)")})
            .store(in: &requests)
    }
    
    /// #Combine and Generics
    func fetchPublisherGeneric<T: Decodable>(_ url: URL, defaultValue: T, decodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, dispatchQueue: DispatchQueue = .main, completion: @escaping (T) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = decodingStrategy
        
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: dispatchQueue)
            .sink(receiveValue:  completion)
            .store(in: &requests)
    }
}








/// #Intentando formatear html
extension String {
    init?(htmlEncodingString: String) {
        
        guard let data = htmlEncodingString.data(using: .utf8) else {
            return nil
        }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType:  NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributeString = try? NSAttributedString(data: data, options: options, documentAttributes: nil).string else {
            return nil
        }
        self.init(attributeString)
    }
}

extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ],
                                              documentAttributes: nil).string
        return decoded ?? self
    }
}


