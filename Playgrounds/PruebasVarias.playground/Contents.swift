import Foundation



class Person {
    var name: String
    var dream:String
    
    init(name: String, dream: String) {
        self.name = name
        self.dream = dream
    }
}


var persona = Person(name: "J", dream: "D")

persona.name = "John"
persona.dream = "Duerme Soñando"

print("N: \(persona.name) D: \(persona.dream)")


class PersonSet{
    private(set) var name: String
    private(set) var dream: String
    
    init(name: String, dream: String) {
        self.name = dream
        self.dream = dream
    }
    
    func newDream(_ forMe: String) {
        
        dream = forMe
    }
}


var personSet = PersonSet(name: "P", dream: "A")

print("N: \(personSet.name) D: \(personSet.dream)")

personSet.newDream("NewDream")


print("N: \(personSet.name) D: \(personSet.dream)")



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

var conjunto = [Int]()
var conjuntoConjuntos = [[Int]]()

var setDeSets = Set<Set<Int>>()

for row in 0..<3 {
    var cols = [Int]()
    var setCols = Set<Int>()
    for col in 6..<9 {
        cols.append(col + (row * 10))
        setCols.insert(col + (row * 10))
    }
    conjuntoConjuntos.append(cols)
    setDeSets.insert(setCols)
}

let colors = Set(["red","green","blue"])
let pantone = Set(["234","234sa","sdfs"])

let coloresSet = Set([colors, pantone])

print(coloresSet)

print("Conjuntos: \(conjuntoConjuntos)",separator: "\n")
print("Sets: \(setDeSets)",separator: "\n")




var setsSquaresSet = Set<Set<Square>>()

for row in 0...6 {
    var cols = Set<Square>()
    for col in 7...10 {
        let sq = Square(row: row, col: col)
        cols.insert(sq)
    }
    setsSquaresSet.insert(cols)
}

print(setsSquaresSet)

