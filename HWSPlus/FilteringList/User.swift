//
//  User.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 8/1/23.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: UUID
    let name: String
    let company: String
    let email: String
    let phone: String
    let address: String
}
