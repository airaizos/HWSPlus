//
//  LocalSession.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import Combine
import Foundation

class LocalSession {


    
    func fetchFile(_ fileUrl: String, _ completion: @escaping (Result<String, Error>) -> Void ) {
        guard let fileUrl = Bundle.main.url(forResource: fileUrl, withExtension: "json"), let data = try? Data(contentsOf: fileUrl) else { return }
        
        let decoder = JSONDecoder()
        
        do {
            let post = try decoder.decode(Post.self, from: data)
            print("** LOCAL ** decodificado:\n \(post.title.rendered)")
            DispatchQueue.main.async {
                completion(.success("LOCAL: \(post.title.rendered)"))
            }
        } catch {
            print("** LOCAL ** Default:\n \(Post.default.title.rendered)")
        }        
    }
    
    func fetchFile(_ fileUrl: String, decodingStrategy: JSONDecoder.KeyDecodingStrategy, _ completion: @escaping (Result<String,Error>) -> Void) {
        guard let fileUrl = Bundle.main.url(forResource: fileUrl, withExtension: "json"), let data = try? Data(contentsOf: fileUrl) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = decodingStrategy
        
        do {
            let macs = try decoder.decode([Mac].self, from: data)
            print("** DECODING STRATEGY \(decodingStrategy)**:\n \(macs[0].name)")
            
            DispatchQueue.main.async {
                completion(.success("LOCAL with Decoding Strategy: \(macs[0].name) \(macs[0].screenSize) \(macs[0].cpuCount)"))
            }
            
        } catch {
            print(Mac.error.name)
        }
    }
}
