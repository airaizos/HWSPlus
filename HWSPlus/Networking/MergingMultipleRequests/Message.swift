//
//  Message.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 13/2/23.
//

import Foundation

struct Message: Codable, Identifiable {
    var id: Int
    var from: String
    var message: String
}
