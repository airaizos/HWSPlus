import Foundation


infix operator <=>

/*
func <=><T: Comparable>(lhs: T, rhs: T) -> Int {
    if lhs < rhs { return -1 }
    if lhs > rhs { return 1 }
    return 0
}
 */
/*
let left = 5
let right = 6
let result: Int = left <=> right
print(result) // - 1
*/

/// #Swiftly approach#

func <=><T: Comparable>(lhs: T, rhs: T) -> ComparisonResult {
    if lhs < rhs { return .orderedAscending }
    if lhs > rhs { return .orderedDescending }
    return .orderedSame
}

func compare(a: Int, b: Int) -> Int {
    return (a <=> b).rawValue
}

print("1 <=> 9 : \(compare(a: 1, b: 9)) .ordenAscendente")
print("18 <=> 9 : \(compare(a: 18, b: 9)) .ordenDescendente")
print("9 <=> 9 : \(compare(a: 9, b: 9)) .mismoOrden")
