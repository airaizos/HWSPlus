//
//  Product.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
}
