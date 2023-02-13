//
//  ChainedNetwork.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Combine
import Foundation

final class ChainedNetwork {
    var requests = Set<AnyCancellable>()
    var url = URL(string: "http://hackingwithswift.com/samples/news.json")!
 
    func fetch<T: Decodable>(_ url: URL, defaultValue: T) -> AnyPublisher<T, Never> {
        let decoder =  JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchChained() {
        fetch(url, defaultValue: [URL]())
            .flatMap { urls in
                urls.publisher.flatMap { url in
                    self.fetch(url, defaultValue: [NewsItem]())
                }
            }
    }
    
}
