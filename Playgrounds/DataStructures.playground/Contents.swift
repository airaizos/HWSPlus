import Foundation

struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()

/**
 **22.Dic.2022**
##Data Structures##
[Linked List](https://www.hackingwithswift.com/plus/data-structures/linked-lists)
**/

//var items = [1,2,3]
//items.remove(at: 1)
/*
var start = CFAbsoluteTimeGetCurrent()
var items = Array(1...200_000)

while items.isEmpty ==  false {
    items.remove(at: 0)
}
var end = CFAbsoluteTimeGetCurrent()
print("Took \(end - start) secons to get to 0 remove first element")

start = CFAbsoluteTimeGetCurrent()
items = Array(1...200_000)

while items.isEmpty == false {
    items.removeLast()
}

end = CFAbsoluteTimeGetCurrent()
print("Took \(end - start) seconds remove last element to geo to 0")
*/

spacer.line("Linked List")

/**Description:  this type references itself, so if it were a struct we’d end up with an infinitely sized struct. Remember, structs are value types and so must have a fixed size to contain all their data, but if **this node links to another node that links to another node and so on, then our struct has no end**. Classes don’t have this problem, because they are all reference types and can store their data wherever they need.
 **/
final class LinkedListNode<Element> {
    var value: Element
    var next: LinkedListNode?
    
    init(value: Element, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

/*
 Each node in the linked list needs to know what comes next, so we construct it in reverse order: we make the last item point nothing, then make the previous item point to the last item, and so on.
 */
final class LinkedList<Element>: ExpressibleByArrayLiteral, Sequence {
    var start: LinkedListNode<Element>?
    
    // Para ir hacia atrás
    public init(arrayLiteral elements: Element...) {
        for element in elements.reversed() {
            start = LinkedListNode(value: element, next: start)
        }
    }
    
    /**
     *Inicializarlo desde un array*
    init(array: Array<Element>) {
        for element in array.reversed() {
            start = LinkedListNode(value: element, next: start)
        }
    }
    **/
    init(array: [Element]) {
        for element in array.reversed() {
            start = LinkedListNode(value: element, next: start)
        }
    }
    //iterator para conformarse con Secuence
    func makeIterator() -> LinkedListIterator<Element> {
        LinkedListIterator(current: start)
    }
}

// Struct para conformarse con Sequence
struct LinkedListIterator<Element>: IteratorProtocol {
    var current: LinkedListNode<Element>?
    
    mutating func next() -> LinkedListNode<Element>? {
        defer { current = current?.next }
        return current
    }
}

/*
final class LinkedList<Element> {
    var start: LinkedListNode<Element>?
}
*/

spacer.line("Initializing From Elements")
let third = LinkedListNode(value: 5)
let second = LinkedListNode(value: 3, next: third)
let first = LinkedListNode(value: 1, next: second)

let list = LinkedList<Int>()
list.start = first

var currentNode = list.start

while let node = currentNode {
    print(node.value, terminator: " ")
    currentNode = node.next
}

spacer.line("Initializing from Array Literal (Go backwards)")

let listFromArrayLiteral: LinkedList<Int> = [1,3,5]

var currentNodeFromArrayLiteral = listFromArrayLiteral.start
while let node = currentNodeFromArrayLiteral {
    print(node.value, terminator: " ")
    currentNodeFromArrayLiteral = node.next
}
spacer.line("Initializing from any Array")

let numbersStringArray = ["One","Two","Three"]
let listAnyArray: LinkedList<String> = LinkedList(array: numbersStringArray)
var currentAnyArray = listAnyArray.start
while let node = currentAnyArray {
    print(node.value, terminator: " ")
    currentAnyArray = node.next
}

spacer.line("Conforming to Sequence")

for node in listAnyArray {
    print(node.value, terminator: " ")
}

/*
let list2 = LinkedList(array: Array(1...200_00))
var start = CFAbsoluteTimeGetCurrent()
while let start = list2.start {
    list2.start = start.next
}
var end = CFAbsoluteTimeGetCurrent()
print("Took \(end - start) seconds to get to 0")
*/

spacer.line("Experimental LinkedList con Enums")

/**
 *Es mucho peor que un array, porque no será posible cambiar aún elemento de la lista de una manera rápida. Hay que rehacer todo*
 */
struct ExperimentalLinkedList<Element> {
    var start: ExperimentalLinkedListNode<Element>?
}

indirect enum ExperimentalLinkedListNode<Element> {
    case node(value: Element, next: ExperimentalLinkedListNode<Element>?)
}

var tercero = ExperimentalLinkedListNode.node(value: "Tercero", next: nil)
var segundo = ExperimentalLinkedListNode.node(value: "Segundo", next: tercero)
var primero = ExperimentalLinkedListNode.node(value: "Primero", next: segundo)

let listEnum = ExperimentalLinkedList(start: primero)
var experimentalCurrentNode = listEnum.start

//primero.next = tercero


/**
 **26.Dic.2022**
##Data Structures##
[Queues and deques](https://www.hackingwithswift.com/plus/data-structures/queues-and-deques)
**/
/**
 *Queues FIFO <> Stack LIFO
 DDQX
 **/

spacer.line("Queues and deques")
struct Queue<Element> {
    private var array = [Element]()
    
    var first: Element? { array.first }
    var last: Element? { array.last }
    
    mutating func append(_ element: Element) {
        array.append(element)
    }
    
   mutating func dequeue() -> Element? {
        guard array.count > 0 else { return nil }
        return array.remove(at: 0)
    }
}


struct Deque<Element> {
    private var array = [Element]()
    var first: Element? { array.first }
    var last: Element? { array.last }
    
    mutating func prepend(_ element: Element) {
        array.insert(element, at: 0)
    }
    
    mutating func append(_ element: Element) {
        array.append(element)
    }
    
    mutating func dequeueFront() -> Element? {
        guard array.count > 0 else { return nil }
        return array.remove(at: 0)
    }
    
    mutating func dequeueBack() -> Element? {
        guard array.count > 0 else { return nil }
        return array.removeLast()
    }
    
}

extension Deque where Element: Equatable {
    func firstIndex(of element: Element) -> Int? {
        for (i, current) in array.enumerated() {
            if current == element {
                return i
            }
        }
        return nil
    }
}

protocol Prioritized {
    var priority: Int { get }
}

struct Work: Prioritized {
    let name: String
    let priority: Int
}


let l = Work(name: "Low", priority: 1)
let ml = Work(name: "Medium Low", priority: 2)
let m = Work(name: "Medium", priority: 3)
let mh = Work(name: "Medium High", priority: 4)
let h = Work(name: "High", priority: 5)

var work = Queue<Work>()

work.append(l)
work.append(h)
work.append(ml)
work.append(m)
work.append(mh)
print(work.dequeue()!)
print(work.dequeue()!)
print(work.dequeue()!)
print(work.dequeue()!)
print(work.dequeue()!)


extension Queue where Element: Prioritized {
    
    ///Encontrar la prioridad más alta que queremos dequeue (sacar de la cola)
    mutating func dequeue() -> Element? {
        guard array.count > 0 else { return nil }
        
        var choice = array[0]
        var choiceIndex = 0
        
        for (index, item) in array.enumerated() {
            // Si el item tiene una prioridad más alta que el item elegido, ese será el item a sacar de la cola
            if item.priority > choice.priority {
                choice = item
                choiceIndex = index
            }
        }
        return array.remove(at: choiceIndex)
    }
}


/**
 **26.Dic.2022**
##Data Structures##
[Trees](https://www.hackingwithswift.com/plus/data-structures/trees)
**/

spacer.line("Trees")

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
    // 4
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    func add(child: Node) {
        children.append(child)
    }
}

var jerry = Node("Jerry")
let seven = Node("Seven")
jerry.add(child: seven)

var adrian = Node("Adrian")
var kelly = Node("Kelly")
adrian.add(child: kelly)

var root = Node("Gina")
root.add(child: jerry)
root.add(child: adrian)
print(root)
print(adrian)


// 1 Equiparables
extension Node: Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

print("Adrian es igual a Jerry \(adrian == jerry)")

extension Node: Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Node: Codable where Value: Codable { }


//2 Cuantificables

print(root.count)
print(adrian.count)

//Identificables

extension Node where Value: Equatable {
    //recursiva
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        return nil
    }
}


//3 Identificables
if let adrian = root.find("Adrian") {
    print("Encontrado: \(adrian.count)")
}

// si se añaden más nodos a los ya existentes. No cambia la cuenta, si es un struct

var patxi = Node("Patxi")
kelly.add(child: patxi)

print(adrian.count)


// Fuction Builders: 4 añadir Nodos de una manera más sencilla
@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}

let luz = Node("Luz") {
    Node("Gina") {
        Node("Jerry") {
            Node("Seven")
        }
        Node("Adrian") {
            Node("Kelly") {
                Node("Patxi")
            }
        }
    }
    Node("Adela") {
        Node("Mónica")
        Node("Gustavo")
    }
}

print(luz.count)


/**
 **28.Dic.2022**
##Data Structures##
[Binary trees](https://www.hackingwithswift.com/plus/data-structures/binary-trees)
**/
spacer.line("Binary Trees")
final class Nodo<Value> {
    var value: Value
    var left: Nodo?
    var right: Nodo?
    
    init(_ value: Value) {
        self.value = value
    }
}

let raiz = Nodo("Morse")
raiz.left = Nodo("_")
raiz.right = Nodo(".")
raiz.left?.left = Nodo("__")
raiz.right?.right = Nodo("..")
raiz.left?.right = Nodo("_.")
raiz.right?.left = Nodo("._")

print(raiz)

extension Array {
    init<T>(_ nodo: Nodo<T>) where Element == Nodo<T> {
        self = [Nodo<T>]()
        
        if let left = nodo.left {
            self += Array(left)
        }
        self += [nodo]
        if let right = nodo.right {
            self += Array(right)
        }
    }
}

for nodo in Array(raiz){
    print(nodo.value)
}

 
/*
 3
5 7
*/
