import Foundation


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
