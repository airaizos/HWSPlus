//
//  FloodFillView.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 5/1/23.
//

import Combine
import SwiftUI

struct FloodFillView: View {
    enum DrawingMode {
        case none, drawing, removing
    }
    //@StateObject??
    @ObservedObject var grid = Grid()
    @State private var drawingMode = DrawingMode.none
    
    let squareSize: CGFloat = 30
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Find Route",action: grid.route)
                Button("Clear Route", action: grid.clear)
                Button("Clear Walls", action: grid.reset)
                Button("Randomize", action: grid.randomize)
            }
            .padding()
            
            VStack(spacing: 0) {
                ForEach(0..<Grid.size) {
                    row in
                    HStack(spacing: 0) {
                        ForEach(0..<Grid.size) {
                            col in
                            let square = grid.squares[row][col]
                            
                            ZStack {
                                Rectangle()
                                    .fill(grid.color(for: square))
                                
                                if square.isWall == false {
                                    Text(String(square.moveCost))
                                }
                            }
                            .frame(width: squareSize, height: squareSize)
                        }
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 1)
                    .onChanged { value in
                        
                        /*Original:
                         let row = Int(value.location.y / squareSize)
                         let col = Int(value.location.x / squareSize)
                         let square = grid.squares[row][col]
                         */
                        let locationY = Int(value.location.y / squareSize)
                        let locationX = Int(value.location.x / squareSize)
                        
                        var row: Int {
                            switch locationY {
                            case ..<0: return 0
                            case Grid.size...: return Grid.size - 1
                            default:
                                return locationY
                            }
                        }
                        
                            var col: Int {
                                switch locationX {
                                case ..<0: return 0
                                case Grid.size...: return Grid.size - 1
                                default:
                                    return locationX
                                }
                                
                            }
                        
                        let square = grid.squares[row][col]
                        
                      print(" Y: \(row) & X: \(col)")
                        if drawingMode == .none {
                            if square.isWall {
                                drawingMode = .removing
                            } else {
                                drawingMode = .drawing
                            }
                        }
                        
                        if drawingMode == .drawing {
                            grid.placeWall(atRow: row, col: col)
                        } else {
                            grid.removeWall(atRow: row, col: col)
                        }
                        
                    }
                    .onEnded { value in
                        drawingMode = .none
                    }
            )
        }
    }
}
struct FloodFillView_Previews: PreviewProvider {
    static var previews: some View {
        FloodFillView()
    }
}
