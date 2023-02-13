//
//  MovieStar.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 9/2/23.
//

import Foundation

struct MovieStar: Codable {
    let name: String
    let movies: [String]
    
    var id: String?
    var createdAt: String?
}


enum UploadError: Error {
    case uploadFailed, decodeFailed
}
