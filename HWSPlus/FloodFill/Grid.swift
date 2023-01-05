//
//  Grid.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/1/23.
//

import Combine
import SwiftUI

final class Grid: ObservableObject {
    //MARK: Variables
    
    static let size = 20
    
    let squares: [[Square]]
    var startSquare: Square
    var endSquare: Square
    
    
    
    
    //MARK: Inicializadores
    init() {
        var grid = [[Square]]()
        
        for row in  0..<Grid.size {
            var cols = [Square]()
            for col in 0..<Grid.size {
                let square = Square(row: row, col: col)
                cols.append(square)
            }
            grid.append(cols)
        }
        squares = grid
        
        startSquare = grid[1][1]
        endSquare = grid[Grid.size - 2][Grid.size - 2]
    }
    
    //MARK: Functions
    
    func reset() {
        objectWillChange.send()
        
        for row in squares {
            for col in row {
                col.isWall = false
            }
        }
    }
    
    func clear() {
        objectWillChange.send()
    }
    
    func randomize() {
        objectWillChange.send()
        
        for row in squares {
            for col in row {
                if col == startSquare { continue }
                if col == endSquare { continue }
                col.isWall = true
            }
        }
        
        for _ in 1...250 {
            let randomRow = Int.random(in: 0..<Grid.size)
            let randomCol = Int.random(in: 0..<Grid.size)
            squares[randomRow][randomCol].isWall = false
        }
        
        route()
    }
    
    func neighbors(for square: Square) -> [Square] {
        var result = [Square]()
       
        
        if (square.col > 0) {
            //check square to the ⬅️
            result.append(squares[square.row][square.col - 1])
        }
        
        if (square.col < Grid.size - 1)  {
            //check square to the ➡️
            result.append(squares[square.row][square.col + 1])
        }
        
        if (square.row > 0) {
            //check square ⬆️
            result.append(squares[square.row - 1][square.col])
        }
        
        if (square.row < Grid.size - 1) {
            //check square ⬇️
            result.append(squares[square.row + 1][square.col])
        }
        
        if (square.col > 0) {
            if (square.row > 0) {
                //check square ↖️
                result.append(squares[square.row - 1][square.col - 1])
            }
            
            if (square.row < Grid.size - 1) {
                //check square ↙️
                result.append(squares[square.row + 1][square.col - 1])
            }
        }
        
        if (square.col < Grid.size - 1) {
            if (square.row > 0) {
                //check square ↗️
                result.append(squares[square.row - 1][square.col + 1])
            }
            if (square.row < Grid.size - 1) {
                // check square ↘️
                result.append(squares[square.row + 1][square.col + 1])
            }
        }
        
        return result
    }
    
    func placeWall(atRow row: Int, col: Int) {
        guard squares[row][col].isWall == false else { return }
        
        objectWillChange.send()
        squares[row][col].isWall = true
    }
    
    func removeWall(atRow row: Int, col: Int) {
        guard squares[row][col].isWall == true else { return }
        
        objectWillChange.send()
        squares[row][col].isWall = false
    }
    
    func color(for square: Square) -> Color {
        if square == startSquare {
            return .blue
        } else if square == endSquare {
            return .green
        } else if square.isWall {
            return .black
        } else {
            return .gray
        }
        
        
    }
    
    func route() {
        
    }
    
}
