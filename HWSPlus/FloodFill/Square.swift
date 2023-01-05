//
//  Square.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/1/23.
//

import SwiftUI

class Square: Equatable {
   
    var row: Int
    var col: Int
    var isWall = false
    var moveCost = -1
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
    
    // Para conformarse con Equatable
    static func ==(lhs: Square, rhs: Square) -> Bool {
        lhs.row == rhs.row && lhs.col == rhs.col
    }
}
