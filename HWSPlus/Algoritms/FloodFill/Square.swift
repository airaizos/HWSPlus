//
//  Square.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/1/23.
//

import SwiftUI

class Square: Equatable, Hashable {
   
    var row: Int
    var col: Int
    var isWall = false
    var moveCost = -1 //Indica que tan dificil es llegar a  ese destino
    
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
    
    // Para conformarse con Equatable
    static func ==(lhs: Square, rhs: Square) -> Bool {
        lhs.row == rhs.row && lhs.col == rhs.col
    }
    
    //Para conformarse con Hashable
   
        func hash(into hasher: inout Hasher) {
            hasher.combine(row)
            hasher.combine(col)
        }
    
}
