//
//  NewsItem.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Foundation

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
    let url: URL
    let main_image: String
    let published_date: Date
}
