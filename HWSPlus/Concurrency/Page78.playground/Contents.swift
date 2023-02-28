import Foundation

extension AsyncSequence {
    
    ///Convierte de una AsyncSequence a un array de Sequence
  func collect() async rethrows -> [Element] {
    try await reduce(into: [Element]()) { $0.append($1) }
  }
}

private func getNumberArray() async throws -> [Int] {
    let url = URL(string: "https://hws.dev/random-numbers.txt")!
    let numbers = url.lines.compactMap(Int.init)
    return try await numbers.collect()
}

if let numbers = try? await getNumberArray() {
    for number in numbers {
        print(number)
    }
}
