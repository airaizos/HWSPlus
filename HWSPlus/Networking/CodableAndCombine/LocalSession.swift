//
//  LocalSession.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
//

import Combine
import Foundation

class LocalSession {


    
    func fetchFile(_ fileUrl: String) {
        guard let fileUrl = Bundle.main.url(forResource: fileUrl, withExtension: "json"), let data = try? Data(contentsOf: fileUrl) else { return }
        
        let decoder = JSONDecoder()
        
        do {
            let post = try decoder.decode(Post.self, from: data)
            print("** LOCAL ** decodificado:\n \(post.title.rendered)")
        } catch {
            print("** LOCAL ** Default:\n \(Post.default.title.rendered)")
        }        
    }
    
    func fetchFile(_ fileUrl: String, decodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        guard let fileUrl = Bundle.main.url(forResource: fileUrl, withExtension: "json"), let data = try? Data(contentsOf: fileUrl) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = decodingStrategy
        
        do {
            let macs = try decoder.decode([Mac].self, from: data)
            print("** DECODING STRATEGY \(decodingStrategy)**:\n \(macs[0].name)")
        } catch {
            print(Mac.error.name)
        }
    }
}
