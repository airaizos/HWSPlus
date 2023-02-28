import Foundation

struct DoubleGenerator: AsyncSequence, AsyncIteratorProtocol {
    typealias Element = Int
    var current = 1
    
    mutating func next() async -> Element? {
        defer { current &*= 2 }
        
        if current < 0 {
            return nil
        } else {
            return current
        }
    }
    
    func makeAsyncIterator() -> DoubleGenerator {
        self
    }
}

let sequence = DoubleGenerator()

for await number in sequence {
    print(number)
}
