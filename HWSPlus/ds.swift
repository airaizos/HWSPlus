//
//  ds.swift
//  HWSPlus
//
//  Created by Adrian Iraizos Mendoza on 27/12/22.
//

import Foundation

final class Node<Value> {
    var value: Value
    
    //  private externaly pero modificable internamente
    private(set) var children: [Node]
    
    // 2 Cuantificables
    
    var count: Int {
        //Este opción es la recursiva
        1 + children.reduce(0) { $0 + $1.count }
        
        //Esta opción contaría solo los hijos directos del nodo.
        //1 + children.reduce(0 { $0 + $1.children.count }
    }
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    func add(child: Node) {
        children.append(child)
    }
}

@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}
