//
//  NetworkCombining.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Combine
import Foundation

final class NetworkCombining {
    private var messagesURL = URL(string: "https://hackingwithswift.com/samples/user-messages.json")!
    private var favoritesURL = URL(string: "http://www.hackingwithswift.com/samples/user-favorites.json")!
    var requests = Set<AnyCancellable>()
    var messages = [Message]()
    var favorites = Set<Int>()
    
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
            .store(in: &requests)
    }
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T) ->AnyPublisher<T,Never> {
        let decoder = JSONDecoder()
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder:  decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func combineTask<T: Decodable>(_ completion: @escaping (Result<T,Never>) -> Void) {
        let messageTask = fetch(messagesURL, defaultValue: [Message]())
        let favoritesTask = fetch(favoritesURL, defaultValue: Set<Int>())
        
        let combined = Publishers.Zip(messageTask,favoritesTask)
        
        combined.sink { loadedMessages, loadedFavorites in
            self.messages = loadedMessages
            self.favorites = loadedFavorites
        }
        .store(in: &requests)
    }
    
    func combiningTask(_ completion: @escaping (Result<([Message],Set<Int>),Error>) -> Void) {
        let messageTask = fetch(messagesURL, defaultValue: [Message]())
        let favoritesTask = fetch(favoritesURL, defaultValue: Set<Int>())
        
        let combined = Publishers.Zip(messageTask,favoritesTask)
        
        combined.sink { (result: ([Message],Set<Int>)) in
            
            do {
                completion(.success(result))
            }
            
        }
        .store(in: &requests)
    }
    
}

/*:
///# Challenges

///  Try extending our new fetch() method so it’s possible to customize how the JSON is decoded, such as configuring the date decoding strategy.
/// Try updating our user interface so that it shows some sort of activity indicator before the network operations complete. You could do this with a state enum that moves between loading and loaded depending on what’s happening.

*/
