import Foundation

struct Spacer {
    func line(_ title: String? = "-") {
        print("\n *-*-*-*-*-*-*-*-*-*\(title!)*-*-*-*-*-*-*-*-*-* \n")
    }
}
let spacer = Spacer()


func count<T: Numeric>(numbers: [T]) -> T {
    let total = numbers.reduce(0, +)
    return total
}

/// Genericos con Protocolos

protocol Prioritized {
    var priority: Int { get }
    func alertIfImportant()
}

struct Work: Prioritized {
    let priority: Int
    
    func alertIfImportant() {
        if priority > 3 {
            print("I'm important Work")
        }
    }
}

struct Document: Prioritized {
    let priority: Int
    func alertIfImportant() {
        if priority > 5 {
            print("I'm important document")
        }
    }
}

/// En tiempo de compilación Swift no sabe que tipo de item Priorizado se va a llamar. Así que lo hace en tiempo de ejecución . **Dynamic dispatch**
func checkPriority(of item: Prioritized) {
    print("Checking priority...")
    item.alertIfImportant()
}

/// De esta manera Swift sabe en tiempo de compilación como se usará, con lo cual generará una copia de esta función para cada tipo de item que la necesite. Esto se llama **Static dispatch**
func checkPriority<P: Prioritized>(of item: P) {
    print("Checking priority...")
    item.alertIfImportant()
}

/// #Challenges#
///If you’d like to test your knowledge of generics, try these challenges:

/// Write a function that prints out the number of letters in a string ("Taylor Swift") or a substring ("Taylor Swift".dropLast(6)) – which protocol do they both use?
///Write a function that accepts an array of any kind of numbers, and returns the average of all the values.


func count<T: LosslessStringConvertible> (letters: T) -> Int {
    return letters.description.count
}

let name = "Taylor Swift"
let numbers = 123456
print(count(letters: name))
print(count(letters: name.dropLast()))
print(count(letters: numbers))

spacer.line("Generics 2")

struct Point<T: Numeric> {
    var x: T
    var y: T
}

let floats: Point<CGFloat> = Point(x: 1.5, y: 2.5)

let doubles: Point<Double> = Point(x: 1.5, y: 2.5)

spacer.line("Generic CountedSets")

struct CountedSet<Element: Hashable>: Equatable, Hashable {
    private var elements = [Element: Int]()
    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func insert(_ element: Element) {
        elements[element, default: 0] += 1
    }
    
    mutating func remove(_ element: Element) {
        elements[element, default: 0] -= 1
    }
    
    func count(for element: Element) -> Int {
        elements[element, default: 0]
    }
    
}

var scores = CountedSet<Int>()

scores.insert(1)
scores.insert(1)
scores.insert(1)
scores.insert(2)
print(scores.count(for: 1))
print(scores.count(for: 2))
print(scores.count(for: 3))


spacer.line("Extending with generics parameters")

var array = [1,2,1,3,1,4,1,5]

array.removeAll(where: { $0 == 1 })
print(array)

/// Quitar los items en una copia en lugar de quitarlos en el orginal

extension Array  where Element: Equatable {
    mutating func removing(_ obj: Element) -> [Element] {
        filter { $0 != obj }
    }
}


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var seen = Set<Element>()
        
        /// rompe el paradigma de la programación funcional al leer/escribir elementos de fuera
        return filter {
            seen.insert($0).inserted
        }
    }
}


extension Sequence {
    func uniqueElements<T: Hashable>(byProperty propertyAccessor: (Element) -> T) -> [Element] {
        var seen = Set<T>()
        var result = [Element]()
        
        for element in self {
            let property = propertyAccessor(element)
            if seen.contains(property) == false {
                result.append(element)
                seen.insert(property)
            }
        }
        return result
    }
}


struct User {
    var name: String
}

let user1 = User(name: "User1")
let user2 = User(name: "User2")
let user3 = User(name: "User3")

let users = [user1,user2,user1,user3,user1]

let uniqueUsers = users.uniqueElements(byProperty: { $0.name })
print(uniqueUsers)
let uniqueUsers1 = users.uniqueElements(byProperty: \.name)
print(uniqueUsers1)

spacer.line("Generic property wrappers")

struct SpeedTracker {
    var current = 0.0
    var highest = 0.0
}

var example = SpeedTracker()
print(example.current)
example.current = -5
print(example.current)
example.current = 10
print(example.current)

@propertyWrapper struct NonNegative<Value: SignedNumeric & Comparable> {
    var value: Value
    
    init(wrappedValue: Value) {
        self.value = max(0, wrappedValue)
    }
    var wrappedValue: Value {
        get { value }
        set { value = max(0, newValue) }
    }
}

struct SpeedTrackerWP {
    @NonNegative var current = 0.0
    @NonNegative var highest = 0.0
    
}
var example2 = SpeedTrackerWP()
print("\n")
print(example2.current)
example2.current = -5
print(example2.current)
example2.current = 10
print(example2.current)


spacer.line("Challenges")
/// **Challenges**
/// If you’d like to take your generics knowledge further, try these challenges:

/// What happens if you remove an item from CountedSet more times than it was added? Can you make this better?
// Make CountedSet conform to Sequence.
/// ✅  Make a property wrapper that limits strings to no more than 16 characters. For a harder challenge, make the limit customizable.


var string = "aksfksjdfkl2342342342342342342ajkldjlasd"
let lengthString = string.count <= 16 ? string.count : 16
let end = string.index(string.startIndex, offsetBy: lengthString)
let start = string.startIndex
let range = start..<end

//var endIndex = string.endIndex

//string.removeSubrange(maxIndex...endIndex)

let subs = string[range]
print(string[range])


@propertyWrapper struct Max16StringLength<Value: StringProtocol > {
    var value: Value
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            let lengthString = newValue.count <= 16 ? newValue.count : 16
            let end = newValue.index(newValue.startIndex, offsetBy: lengthString)
            let start = newValue.startIndex
            let range = start..<end
            
            value = String(newValue[range]) as! Value
        }
    }
}
struct Text {
    @Max16StringLength var text = ""
}

var texto = Text()
texto.text = "1234567890123456789123456789"


print(texto.text)
