import Foundation


func factors(for number: Int) async -> [Int] {
    guard number > 50 else { return []}
    var result = [Int]()
    
    for check in 1...number {
        if number.isMultiple(of: check) {
            result.append(check)
            await Task.yield()
        }
    }
    return result
}

let factor = await factors(for: 5)
