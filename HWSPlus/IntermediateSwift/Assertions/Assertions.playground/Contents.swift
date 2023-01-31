import Foundation

func sum(of numbers: [Int]) -> Int {
    assert(numbers.count > 0, "Siempre se deben añadir números a sumar")
    return numbers.reduce(0, +)
}

//let case1 = sum(of: [Int]())
//print(case1)

let case2 = sum(of: [-1,2])
print(case2)


let number = Int.random(in: 1...3)

switch number {
case 1: print("rolled a 1")
case 2: print("rolled a 2")
case 3: print("rolled a 3")
default: assertionFailure("Rolling a 3-sided dice shouldn't gave any other results")
}


extension Array {
    mutating func removeRandom(_ number: Int) {
        precondition(count >= number,"Can't remove \(number) items from an array")
        
        for _ in 0..<number {
            remove(at: Int.random(in: 0..<count))
        }
    }
}

var numeros = [1,2,3,4,5,6,7]

numeros.removeRandom(5)

func updateStatus(to newStatus: String) -> String {
    if newStatus == "active" || newStatus == "inactive" {
        return "updating Status"
    }
    preconditionFailure("Unknown status: \(newStatus)")
}

//let case4 = updateStatus(to: "pause")
let case5 = updateStatus(to: "active")

guard let url = Bundle.main.url(forResource: "input", withExtension: "json") else {
    fatalError("Failed to locate input.json in bundle")
}
