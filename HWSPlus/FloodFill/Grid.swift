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
    
 //   let squares: Set<Set<Square>>
   let squares: [[Square]]
    var startSquare: Square
    var endSquare: Square
    
    //Squares tenemos que chequear
    var queuedSquares = [Square]()
    //Squares que ya chequeamos
    var checkedSquares = [Square]()
    //Squares que hacen el camino correcto
    var path = [Square]()
    
    //pausar cada movimiento en 3 sitios
    var stepper: Cancellable?
    
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
        //1
        stepper?.cancel()
        
        objectWillChange.send()
        
        for row in squares {
            for col in row {
                col.isWall = false
            }
        }
    }
    
    func clear() {
        objectWillChange.send()
        resetSquares()
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
        } else if path.contains(square){
            return .white
        } else if queuedSquares.contains(square) {
            return .orange
        } else if checkedSquares.contains(square) {
            return Color.orange.opacity(0.5)
        } else {
            return .gray
        }
    }
    
    func route() {
        //Empezamos por métodos más simples
        resetSquares()
       
        /*
        while queuedSquares.isEmpty == false {
            stepRoute()
        }
         */
        
        stepper = DispatchQueue.main.schedule(after: .init(.now()), interval: 0.01, stepRoute)
    }
    
    
    func floodFill(from square: Square) {
        //Encuentra todos los squares vecinos
        
        let checkSquares = neighbors(for: square)
        
        for checkSquare in checkSquares {
            //omite el square si es Wall
            guard checkSquare.isWall == false else { continue }
            
            //Evalua el costo de moverse a través de ese square
            if checkSquare.moveCost == -1 || square.moveCost + 1 < checkSquare.moveCost {
                checkSquare.moveCost = square.moveCost + 1
                
                queuedSquares.append(checkSquare)
            }
        }
    }
    
    func stepRoute() {
        objectWillChange.send()
        
        let square = queuedSquares.removeFirst()
        
        checkedSquares.append(square)
        
        if square == endSquare {
            //Ruta encontrada
            selectRoute()
            return
        }
        
        floodFill(from: square)
        
        if queuedSquares.isEmpty {
            // Hemos terminado de verificar todos los squares
            selectRoute()
        }
    }
    
    func selectRoute() {
        //2
        stepper?.cancel()
        
        guard endSquare.moveCost != -1 else {
            print("No route possible")
            return
        }
        
        path.append(endSquare)
        var current = endSquare
        
        while current != startSquare {
            for neighbor in neighbors(for: current) {
                guard neighbor.moveCost != -1 else { continue }
                
                if neighbor.moveCost < current.moveCost {
                    path.append(neighbor)
                    current = neighbor
                    break
                }
            }
        }
    }
    
    func resetSquares() {
        //3
        stepper?.cancel()
        
        checkedSquares.removeAll()
        queuedSquares.removeAll()
        path.removeAll()
        
        for row in squares {
            for col in row {
                col.moveCost = -1
            }
        }
        queuedSquares.append(startSquare)
        startSquare.moveCost = 0
    }
}

