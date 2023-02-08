//
//  Post.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/2/23.
// https://proximaparadaswift.dev/wp-json/wp/v2/posts/388

import Foundation

struct Post: Codable {
    let id: Int
    let date: String
    let title: Content
    let content: Content
    
    static let `default` = Post(id: 1, date: "08-feb-2023", title: Content(rendered: "Default Titulo"), content: Content(rendered: "Default Contenido"))
}

struct Content: Codable {
    let rendered: String
}


struct Mac: Codable {
    let name: String
    let screenSize: Int
    let cpuCount: Int
    
    static let `error` = Mac(name: "Error", screenSize: 0, cpuCount: 0)
}
