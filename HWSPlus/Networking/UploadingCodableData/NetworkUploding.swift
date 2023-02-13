//
//  NetworkUploding.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/2/23.
//

import SwiftUI

class NetworkUploading {
    
    var movieStar: MovieStar?
    
    func upload(_ data: MovieStar, to url: URL) {
        let encoder = JSONEncoder()
        
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? encoder.encode(data)
        
        URLSession.shared.dataTask(with: request) { data,response, error in
            if let data = data {
                let result =  String(decoding: data, as: UTF8.self)
                
                print(result)
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                print("Unkwnown result: No data, no error")
            }
        }.resume()
    }
    
    func uploadGeneric<Input: Encodable, Output: Decodable>(
        _ data: Input,
        to url: URL,
        httpMethod: String = "POST",
        contentType: String = "application/json",
        completion: @escaping(Result<Output, UploadError>) -> Void) {
            
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            request.setValue(contentType, forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            request.httpBody = try? encoder.encode(data)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoded = try JSONDecoder().decode(Output.self, from: data)
                            completion(.success(decoded))
                        } catch {
                            completion(.failure(.decodeFailed))
                        }
                    } else if error != nil {
                        completion(.failure(.uploadFailed))
                    } else {
                        print("Unkwown result; no data and no error!")
                    }
                }
            }.resume()
        }
}
